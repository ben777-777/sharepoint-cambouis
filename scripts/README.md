# Utilisation du script d'Édition SharePoint

Le script `edit-sharepoint-page.ps1` a été généré via BMAD Fast pour modifier dynamiquement une page SharePoint.

## Prérequis
1. Le module PnP.PowerShell doit être installé (voir `docs/sharepoint-powershell.md`).
2. Une application "Entra ID" (Azure AD) doit être configurée avec les droits SharePoint (`Sites.ReadWrite.All` ou `Sites.FullControl.All`).

## Exécution

Depuis le terminal Antigravity ou votre terminal PowerShell local :

```powershell
# Déplacer vous dans le dossier scripts
cd scripts

# Exécuter le script en passant les bons paramètres
.\edit-sharepoint-page.ps1 -SiteUrl "https://VOTRE_TENANT.sharepoint.com/sites/VOTRE_SITE" -ClientId "VOTRE_CLIENT_ID_ENTRA_ID" -PageName "Accueil.aspx"
```

Vous pouvez également passer un texte HTML spécifique :
```powershell
.\edit-sharepoint-page.ps1 -SiteUrl "..." -ClientId "..." -PageName "..." -Content "<h1>Nouveau Titre</h1><p>Généré via Antigravity</p>"
```
