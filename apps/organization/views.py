#coding:utf-8

from django.shortcuts import render
from django.views.generic.base import View
from pure_pagination import Paginator,EmptyPage,PageNotAnInteger
from django.http import HttpResponse
from django.db.models import Q

from .models import CourseOrg,CityDict,Teacher
from .forms import UserAskForm
from courses.models import Course
from operation.models import UserFavorite


class OrgView(View):
    # 课程机构列表功能
    def get(self,request):
        all_citys = CityDict.objects.all()
        all_orgs = CourseOrg.objects.all()
        # 机构排名
        hot_orgs = all_orgs.order_by("-click_nums")[:3]

        # 机构搜索功能
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:                    #i代表不区分大小写
            all_orgs = all_orgs.filter(Q(name__icontains=search_keywords)|Q(desc__icontains=search_keywords))

        # 取出筛选城市
        city_id = request.GET.get('city','')
        if city_id:
            all_orgs = all_orgs.filter(city_id=int(city_id))

        # 类别筛选
        category = request.GET.get('ct','')
        if category:
            all_orgs = all_orgs.filter(category=category)

        # 学习人数、课程数排名
        sort = request.GET.get('sort','')
        if sort:
            if sort == 'students':
                all_orgs = all_orgs.order_by('-students')
            elif sort == 'courses':
                all_orgs = all_orgs.order_by('-course_nums')

        # 对课程机构进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_orgs,5,request=request)
        orgs = p.page(page)

        org_nums = all_orgs.count()

        return render(request,'org-list.html',{
            'all_citys':all_citys,
            'all_orgs':orgs,
            'org_nums':org_nums,
            'city_id':city_id,
            'category':category,
            'hot_orgs':hot_orgs,
            'sort':sort,
        })


class AddUserAskView(View):
    # 用户添加咨询
    def post(self,request):
        userask_form = UserAskForm(request.POST)
        if userask_form.is_valid():
            user_ask = userask_form.save(commit=True)
            return  HttpResponse("{'status':'success'}",content_type='application/json')
        else:
            return HttpResponse("{'status':'fail','msg':u'添加出错'}", content_type='application/json')


class OrgHomeView(View):
    # 机构首页
    def get(self,request,org_id):
        current_page = 'home'
        course_org = CourseOrg.objects.get(id=int(org_id))
        course_org.click_nums += 1
        course_org.save()
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user,fav_id=course_org.id,fav_type=2):
                has_fav = True
        all_courses = course_org.course_set.all()[0:3]
        all_teachers = course_org.teacher_set.all()[0:1]
        return render(request,'org-detail-homepage.html',{
            'all_courses':all_courses,
            'all_teachers':all_teachers,
            'course_org':course_org,
            'current_page':current_page,
            'has_fav':has_fav,
        })


class OrgCourseView(View):
    # 机构课程列表页
    def get(self,request,org_id):
        current_page = 'course'
        course_org = CourseOrg.objects.get(id=int(org_id))
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        all_courses = course_org.course_set.all()
        return render(request,'org-detail-course.html',{
            'all_courses':all_courses,
            'course_org':course_org,
            'current_page': current_page,
            'has_fav': has_fav,
        })


class OrgDescView(View):
    # 机构描述
    def get(self,request,org_id):
        current_page = 'desc'
        course_org = CourseOrg.objects.get(id=int(org_id))
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        return render(request,'org-detail-desc.html',{
            'course_org':course_org,
            'current_page': current_page,
            'has_fav': has_fav,
        })


class OrgTeacherView(View):
    # 机构讲师列表页
    def get(self,request,org_id):
        current_page = 'teach'
        course_org = CourseOrg.objects.get(id=int(org_id))
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        all_teachers = course_org.teacher_set.all()
        return render(request,'org-detail-teachers.html',{
            'all_teachers':all_teachers,
            'course_org':course_org,
            'current_page': current_page,
            'has_fav': has_fav,
        })


class AddFavView(View):
    # 用户收藏及用户取消收藏
    def post(self,request):
        fav_id = request.POST.get('fav_id',0)
        fav_type = request.POST.get('fav_type',0)
        # 判断登录状态
        if not request.user.is_authenticated():
            return  HttpResponse("{'status':'fail','msg':'用户未登录'}", content_type='application/json')

        exist_records = UserFavorite.objects.filter(user=request.user,fav_id=int(fav_id),fav_type=int(fav_type))
        if exist_records:
            exist_records.delete() #如果记录存在，表示用户取消收藏
            if int(fav_type) == 1:
                course = Course.objects.get(id=int(fav_id))
                course.fav_nums -= 1
                if course.fav_nums < 0:
                    course.fav_nums = 0
                course.save()
            elif int(fav_type) == 2:
                org = CourseOrg.objects.get(id=int(fav_id))
                org.fav_nums -= 1
                if org.fav_nums < 0:
                    org.fav_nums = 0
                org.save()
            elif int(fav_type) == 3:
                teacher = Teacher.objects.get(id=int(fav_id))
                teacher.fav_nums -= 1
                if teacher.fav_nums < 0:
                    teacher.fav_nums = 0
                teacher.save()

            return  HttpResponse("{'status':'success','msg':'收藏'}", content_type='application/json')
        else:
            user_fav = UserFavorite()
            if int(fav_id) > 0 and int(fav_type) > 0:
                user_fav.user = request.user
                user_fav.fav_id = int(fav_id)
                user_fav.fav_type = int(fav_type)
                user_fav.save()

                if int(fav_type) == 1:
                    course = Course.objects.get(id=int(fav_id))
                    course.fav_nums += 1
                    course.save()
                elif int(fav_type) == 2:
                    org = CourseOrg.objects.get(id=int(fav_id))
                    org.fav_nums += 1
                    org.save()
                elif int(fav_type) == 3:
                    teacher = Teacher.objects.get(id=int(fav_id))
                    teacher.fav_nums += 1
                    teacher.save()
                return HttpResponse("{'status':'success','msg':'已收藏'}", content_type='application/json')
            else:
                return HttpResponse("{'status':'fail','msg':'收藏出错'}", content_type='application/json')


class TeacherListView(View):
    # 机构讲师view
    def get(self,request):
        all_teachers = Teacher.objects.all()

        # 讲师搜索功能
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:  # i代表不区分大小写
            all_teachers = all_teachers.filter(Q(name__icontains=search_keywords) |
                                               Q(work_company__icontains=search_keywords) |
                                               Q(work_position__icontains=search_keywords) )
        # 人气排序
        sort = request.GET.get('sort','')
        if sort:
            if sort == 'hot':
                all_teachers = all_teachers.order_by('-click_nums')

        hots_teachers = all_teachers.order_by('-click_nums')[:3]

        # 对课程讲师进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_teachers, 1, request=request)
        teachers = p.page(page)

        teacher_nums = all_teachers.count()

        return render(request,'teachers-list.html',{
            'all_teachers':teachers,
            'hots_teachers':hots_teachers,
            'teacher_nums':teacher_nums,
            'sort':sort,
        })


class TeacherDetailView(View):
    def get(self,request,teacher_id):
        teacher = Teacher.objects.get(id=int(teacher_id))
        teacher.click_nums += 1
        teacher.save()
        fav_teacher=False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user,fav_type=3,fav_id=teacher.id):
                fav_teacher = True
        fav_org = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user,fav_type=2, fav_id=teacher.org.id):
                fav_org = True
        all_courses = Course.objects.filter(teacher=teacher)
        hots_teachers = Teacher.objects.all().order_by('-click_nums')[:3]
        return render(request,'teacher-detail.html',{
            'teacher':teacher,
            'all_courses':all_courses,
            'hots_teachers':hots_teachers,
            'fav_teacher':fav_teacher,
            'fav_org':fav_org,
        })








