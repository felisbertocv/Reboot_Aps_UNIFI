@echo off
title REBOOT_AP_PRO_UNIFI
set ap_user=username_do_terminal
set ap_pass=passwor_do_terminal
REM echo "Endereços dos APS Reniciados: " >> "C:\rebootunifi\relatorios\log_ap_reboot_%date%.txt"
for /F %%a in (ip_aps.txt) do ( 	
  REM c:\rebootunifi\plink %ap_user%@%%a -pw %ap_pass% "reboot"
  echo %%a >> "C:\rebootunifi\relatorios\log_ap_reboot_%date%.txt"
)

set subject="Reboot APS"
set email_from=user@dominio.com
set email_to=user@dominio.com
set body="############Conteudo do e-mail"
set server=servidor_email
blat.exe -attach "C:\rebootunifi\relatorios\log_ap_reboot_%date%.txt" -p configsmtp -to %email_to% -subject %subject% -body %body% -server %server% -f %email_from%
pause

