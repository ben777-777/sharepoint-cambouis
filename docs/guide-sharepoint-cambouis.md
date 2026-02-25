# Manuel Utilisateur - Sharepoint Cambouis

Bienvenue dans le guide d'utilisation du projet **Sharepoint Cambouis**, conçu pour automatiser les interactions avec SharePoint Online via PowerShell.

## 1. À propos de l'Outil

**Sharepoint Cambouis** s'appuie sur le framework [PnP.PowerShell](https://pnp.github.io/powershell/) pour modifier du contenu dynamiquement sur des sites modernes SharePoint de Microsoft 365. Le script phare de ce projet est `edit-sharepoint-page.ps1`.

### Fonctionnalités
- Connexion interactive via Azure Active Directory (Entra ID).
- Ciblage et récupération de pages SharePoint (*ClientSidePages*).
- Injection de balisage HTML/Texte automatisé.
- Publication des pages pour rendre la modification publique.

---

## 2. Prérequis Techniques Obligatoires

Avant toute exécution, vous devrez préparer votre environnement.

### A. Installation de PnP.PowerShell
Vous devez exécuter la commande suivante (en administrateur) :
```powershell
Install-Module PnP.PowerShell -Scope CurrentUser -Force
```

### B. Création de l'Application Entra ID (Azure AD)
Microsoft exige désormais qu'une application soit enregistrée pour se connecter à SharePoint via PnP.
1. Allez sur le [Portail Azure (Entra ID)](https://portal.azure.com/).
2. **Inscriptions d'applications** > Nouvelle inscription (ex: *Sharepoint Auto*).
3. Authentification : Cochez "Gérer les applications clientes publiques (flux mobile et bureau) -> **Oui**".
4. **API autorisées** : Ajoutez *SharePoint* > *Sites.ReadWrite.All* ou *Sites.FullControl.All* (Délégué).
5. Récupérez votre **ID d'application (Client ID)** (un code comme `a1b2c3d4-...`).

---

## 3. Guide d'Utilisation du Script Principal

Ouvrez un terminal PowerShell à la racine du projet ou déplacez-vous dans le dossier `scripts/`.

### Utilisation Standard (Texte par défaut)
```powershell
.\scripts\edit-sharepoint-page.ps1 -SiteUrl "https://CONTOSO.sharepoint.com/sites/MonSite" -ClientId "1234abcd-..." -PageName "Accueil.aspx"
```

### Injection de Contenu Personnalisé (HTML)
```powershell
.\scripts\edit-sharepoint-page.ps1 -SiteUrl "https://CONTOSO.sharepoint.com/sites/MonSite" -ClientId "1234abcd-..." -PageName "MaPage.aspx" -Content "<h3>Bilan Automatique</h3><p>Mise à jour: $(Get-Date)</p>"
```

### Que se passe-t-il lors de l'exécution ?
1. Une fenêtre Microsoft d'authentification va s'ouvrir sur votre navigateur.
2. Une fois connecté, le script va lier PnP à la page cible.
3. Le texte est injecté en bas de la page.
4. La page est automatiquement enregistrée et publiée avec un message de versionning interne.

## 4. Astuces & Dépannage
- Si vous obtenez l'erreur "Access Denied" (403), vérifiez que votre utilisateur a bien le droit de modifier la page sur ce site SharePoint, ET que l'application Entra ID contient bien `Sites.ReadWrite.All`.
- Pour découvrir l'aide native du script : `Get-Help .\scripts\edit-sharepoint-page.ps1 -Detailed`.
