Echo start cmd /c "hexo clean&&hexo g&&hexo d "   

@Echo Off

Echo ��ѡ�� Y. ����������            N. �˳�
Echo.
Set /p var=��ѡ��:
If /i %var%==Y (start cmd /k "Xcopy source D:\software1\hexo\source /E/H/C/I/Y&&hexo clean&&hexo g&&hexo d&&hexo s ") else (Exit)
Pause
%0 