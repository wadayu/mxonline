#coding:utf-8
from django.apps import AppConfig

#xadmin后台中文显示
class OrganizationConfig(AppConfig):
    name = 'organization'
    verbose_name = u'机构管理'
