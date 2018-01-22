@echo off
title REBOOT_AP_PRO_UNIFI
set ap_user=admin
set ap_pass=S3A32037qZbo2Pkd
REM echo "Endereços dos APS Reniciados: " >> "C:\rebootunifi\relatorios\log_ap_reboot_%date%.txt"
for /F %%a in (ip_aps.txt) do ( 	
  REM c:\rebootunifi\plink admin@%%a -pw %ap_pass% "reboot"
  echo %%a >> "C:\rebootunifi\relatorios\log_ap_reboot_%date%.txt"
)

set subject="Reboot APS AvilaSec"
set email_from=msn.networking@linkconsulting.com
set email_to=felisberto.monteiro@linkconsulting.com
set body="Os aps da infrastrutura AvilaSec foram reiniciados Consulte o endereço: https://psunificontroller.aitec.pt:8443, para verificar os seus estados."
set server=psmail2013.aitec.pt
blat.exe -attach "C:\rebootunifi\relatorios\log_ap_reboot_%date%.txt" -p configsmtp -to %email_to% -subject %subject% -body %body% -server %server% -f %email_from%
pause

