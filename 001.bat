Echo start cmd /c "hexo clean&&hexo g&&hexo d "   

@Echo Off

Echo 请选择 Y. 启动三件套            N. 退出
Echo.
Set /p var=请选择:
If /i %var%==Y (start cmd /k "Xcopy source D:\software1\hexo\source /E/H/C/I/Y&&hexo clean&&hexo g&&hexo d&&hexo s ") else (Exit)
Pause
%0 