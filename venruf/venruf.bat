@echo off
:menu
cls
echo ==========================
echo      Venruf ISO Yazici
echo ==========================
echo [1] ISO Ekle
echo [2] USB'yi Hazirla
echo [3] ISO'lari Listele
echo [4] ISO Yazdir
echo [5] Cikis
echo ==========================
set /p secim=Seciminizi girin: 
if "%secim%"=="1" goto ekle
if "%secim%"=="2" goto hazirla
if "%secim%"=="3" goto listele
if "%secim%"=="4" goto yazdir
if "%secim%"=="5" exit
goto menu

:ekle
cls
echo ISO dosyasinin yolunu girin:
set /p iso_yolu=
if not exist "%iso_yolu%" echo Dosya bulunamadi! & pause & goto menu
copy "%iso_yolu%" "ISOLAR" >nul
echo ISO eklendi! & pause & goto menu

:hazirla
cls
echo USB surucusunun harfini girin (Ornek: E):
set /p usb_harf=
if not exist %usb_harf%:\ echo USB bulunamadi! & pause & goto menu
diskpart /s hazirla.txt
echo USB hazirlandi! & pause & goto menu

:listele
cls
echo Kayitli ISO'lar:
dir /b "ISOLAR"
pause
goto menu

:yazdir
cls
echo Yazdirilacak ISO'yu secin:
dir /b "ISOLAR"
set /p iso_sec=Dosya adini girin: 
if not exist "ISOLAR\%iso_sec%" echo Dosya bulunamadi! & pause & goto menu
xcopy "ISOLAR\%iso_sec%" %usb_harf%:\ /E /H /C /I
echo ISO yazdirildi! & pause & goto menu
