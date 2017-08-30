#coding:utf-8
__author__ = 'WangDy'
__date__ = '2017/7/11 14:39'

import xadmin
from xadmin import views

from .models import EmailVerifyRecord,Banner


# 设置显示主题
class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True


# 设置title和页脚
class GlobalSetting(object):
    site_title = '慕学在线管理系统'
    site_footer = '慕学在线教育网'
    # 设置叠加菜单
    menu_style = 'accordion'


class EmailVerifyRecordAdmin(object):
    list_display = ['code','email','send_type','send_time']
    search_fields = ['code','email','send_type']
    list_filter = ['code','email','send_type','send_time']


class BannerAdmin(object):
    list_display = ['title', 'image', 'url', 'index','add_time']
    search_fields = ['title', 'image', 'url', 'index']
    list_filter = ['title', 'image', 'url', 'index','add_time']


xadmin.site.register(EmailVerifyRecord,EmailVerifyRecordAdmin)
xadmin.site.register(Banner,BannerAdmin)

xadmin.site.register(views.BaseAdminView,BaseSetting)
xadmin.site.register(views.CommAdminView,GlobalSetting)