# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2017-07-12 13:56
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='courseorg',
            name='image',
            field=models.ImageField(upload_to='media/org/%Y/%m', verbose_name='封面图片'),
        ),
    ]
