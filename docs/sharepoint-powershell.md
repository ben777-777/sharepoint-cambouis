# Automatiser SharePoint avec PowerShell (PnP)

Guide pour se connecter à Microsoft SharePoint Online et automatiser des opérations (sites, listes, fichiers) depuis ta machine avec **PnP.PowerShell**.

## Prérequis

- **PowerShell 7.4+** (recommandé) ou PowerShell 5.1 sur Windows
- Un **compte Microsoft 365** avec accès à SharePoint
- À partir de 2024 : **inscription d’une application Entra ID** (obligatoire pour PnP)

## 1. Installer PnP.PowerShell

Dans PowerShell (en mode Administrateur si installation pour tous les utilisateurs) :

```powershell
Install-Module PnP.PowerShell -Scope CurrentUser
```

Mise à jour :

```powershell
Update-Module PnP.PowerShell -Scope CurrentUser
```

Vérifier la version :

```powershell
Get-InstalledModule -Name PnP.PowerShell
```

## 2. Inscription d’une application Entra ID (obligatoire)

PnP ne peut plus utiliser une app multi-tenant partagée. Il faut créer **ta propre** application dans Entra ID (Azure AD) :

1. Aller sur [Portail Azure](https://portal.azure.com) > **Entra ID** > **Inscriptions d’applications** > **Nouvelle inscription**.
2. Nom (ex. `PnP-PowerShell-MonProjet`), types de comptes selon ton cas, pas d’URI de redirection pour une app “native”/script.
3. Après création : noter l’**ID d’application (Client ID)**.
4. **Autorisations** : ajouter les permissions nécessaires (ex. Microsoft Graph et SharePoint selon ce que tu fais) :
   - Ex. SharePoint : `Sites.Read.All` ou `Sites.FullControl.All` (délegué ou application selon le type d’auth).
5. Pour une connexion **interactive (navigateur)** : dans **Authentification**, activer “Applications client publiques” / “Public client” si demandé.

Documentation officielle PnP : [Register an application](https://pnp.github.io/powershell/articles/registerapplication.html).

## 3. Se connecter à SharePoint

Remplacer `TON_TENANT` par le nom de ton tenant (ex. `contoso` pour `contoso.sharepoint.com`) et `TON_CLIENT_ID` par l’ID de ton application Entra ID.

### Connexion interactive (navigateur + MFA)

Ouvre un navigateur pour te connecter et faire la MFA :

```powershell
Connect-PnPOnline -Url "https://TON_TENANT.sharepoint.com" -Interactive -ClientId "TON_CLIENT_ID"
```

### Connexion à un site précis

```powershell
Connect-PnPOnline -Url "https://TON_TENANT.sharepoint.com/sites/NomDuSite" -Interactive -ClientId "TON_CLIENT_ID"
```

### Connexion sans navigateur (code device)

Utile sur une machine sans interface (ou autre appareil) :

```powershell
Connect-PnPOnline -Url "https://TON_TENANT.sharepoint.com" -DeviceLogin -ClientId "TON_CLIENT_ID"
```

Tu obtiens un code à saisir sur [https://microsoft.com/devicelogin](https://microsoft.com/devicelogin).

### Client ID par défaut (éviter de le retaper)

Tu peux configurer un Client ID par défaut : [Default Client ID](https://pnp.github.io/powershell/articles/defaultclientid.html). Ensuite tu peux omettre `-ClientId` dans `Connect-PnPOnline`.

## 4. Opérations utiles

### Lister les sites

```powershell
Get-PnPTenantSite
# ou pour le site courant
Get-PnPSite
```

### Lister les listes / bibliothèques du site courant

```powershell
Get-PnPList
```

### Télécharger un fichier

```powershell
# URL relative à la racine du site (ex. bibliothèque "Documents partagés")
Get-PnPFile -Url "/sites/MonSite/Shared Documents/rapport.pdf" -Path "C:\Temp" -FileName "rapport.pdf" -AsFile
```

### Télécharger tout un dossier

```powershell
Get-PnPFolder -RelativeUrl "Shared Documents/MonDossier" | Get-PnPFile | ForEach-Object {
  Get-PnPFile -Url $_.ServerRelativeUrl -Path "C:\Temp\Export" -AsFile -Force
}
```

### Déposer un fichier (upload)

```powershell
Add-PnPFile -Path "C:\Temp\rapport.pdf" -Folder "Shared Documents"
# ou avec un nouveau nom
Add-PnPFile -Path "C:\Temp\rapport.pdf" -Folder "Shared Documents" -NewFileName "rapport-2024.pdf"
```

### Se déconnecter

```powershell
Disconnect-PnPOnline
```

## 5. Script exemple

Un script exemple est fourni : **`docs/sharepoint-connect.ps1`**.  
Tu peux le copier, remplacer `TON_TENANT` et `TON_CLIENT_ID`, puis l’exécuter pour tester la connexion et lister les listes du site.

## Références

- [PnP PowerShell](https://pnp.github.io/powershell/)
- [Installation](https://pnp.github.io/powershell/articles/installation.html)
- [Authentification](https://pnp.github.io/powershell/articles/authentication.html)
- [Inscription d’application Entra ID](https://pnp.github.io/powershell/articles/registerapplication.html)
- [Get-PnPFile](https://pnp.github.io/powershell/cmdlets/Get-PnPFile.html) / [Add-PnPFile](https://pnp.github.io/powershell/cmdlets/Add-PnPFile.html)
