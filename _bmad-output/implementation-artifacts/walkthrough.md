# Édition de Page SharePoint via PnP PowerShell

> [!NOTE]
> Suivant les principes BMAD Fast, nous sommes passés directement à la phase d'implémentation pour le besoin "Sharepoint Cambouis".

## Réalisations

- Mmise en place de l'architecture pour contacter SharePoint via Antigravity.
- Création du script `scripts/edit-sharepoint-page.ps1` basé sur **PnP.PowerShell**.
- Le script utilise l'authentification moderne (Entra ID, mode interactif), récupère une page cible, y ajoute un composant texte, puis la sauvegarde/publie.
- Ajout d'une documentation courte d'utilisation dans `scripts/README.md`.

## Validation & Prochaines étapes

Le script est actuellement paramétré via des arguments PowerShell. 
Comme la **connexion à M365 requiert des identifiants (Tenant URL, Client ID)** que je ne possède pas, je ne peux pas exécuter le test final d'ici de manière automatisée.

### Comment valider manuellement ?

1. Assurez-vous d'avoir enregistré une application dans **Entra ID** avec accès à SharePoint (voir [Docs](file:///c:/Users/b_arnaud/Documents/Claude%20Projects/Sharepoint%20Cambouis/docs/sharepoint-powershell.md)).
2. Ouvrez le terminal.
3. Exécutez :
```powershell
.\scripts\edit-sharepoint-page.ps1 -SiteUrl "https://VOTRE_TENANT.sharepoint.com/sites/VOTRE_SITE" -ClientId "VOTRE_CLIENT_ID" -PageName "NomDeLaPageCible"
```
4. Observez la modification sur le navigateur web de SharePoint.
