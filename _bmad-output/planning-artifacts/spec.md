# Sharepoint Cambouis - Spécifications 

> [!NOTE]
> Modèle généré pour répondre au besoin d'automatisation et d'interaction avec SharePoint via Claude / Antigravity.

## Objectif Principal
Automatiser la modification du contenu d'une page **SharePoint Online** directement depuis la CLI Antigravity en utilisant les capacités locales de la machine.

## Fonctionnalités Clés
1. **Authentification** : Connexion à l'environnement M365/SharePoint via une application Entra ID enregistrée.
2. **Récupération de la page** : Ciblage et chargement d'une page moderne (Site Page) spécifique existant sur le site.
3. **Modification du contenu** : Ajout ou mise à jour de composants web (WebParts de texte) sur la page.
4. **Publication / Sauvegarde** : Sauvegarde et publication des modifications pour les rendre visibles aux utilisateurs SharePoint.

## Architecture & Logique
Le projet s'appuiera sur un **Script PowerShell (`.ps1`)** exécuté localement par Antigravity.
- **Dépendance technique :** Utilisation du module `PnP.PowerShell` (standard de MS pour la manipulation SharePoint côté client).
- **Entrées requises (Variables d'environnement / paramètres) :**
  - URL du Tenant PnP / Site (`$SiteUrl`)
  - Identifiant de l'application Entra ID (`$ClientId`)
  - Nom exact ou URL relative de la page à modifier (`$PageName`)
  - Contenu HTML ou texte à injecter (`$Content`)

### Étapes du flux PowerShell envisagé :
1. `Connect-PnPOnline` (Authentification interactive ou via device login).
2. `Get-PnPClientSidePage` (Récupération des métadonnées de la page).
3. `Add-PnPClientSideText` / modification des contrôles existants.
4. `Set-PnPClientSidePage` / `$Page.Save()` / `$Page.Publish()`.

## User Review Required

> [!IMPORTANT]
> **Configuration Requise par l'Utilisateur**
> Pour que le script fonctionne quand on va l'écrire, il te faudra avoir configuré (ou me donner) :
> - L'URL du site SharePoint cible
> - Un **Client ID (ID d'application d'Entra ID)** configuré pour le site (le module *PnP.PowerShell* l'exige désormais, voir `docs/sharepoint-powershell.md`).

## Verification Plan

### Manual Verification
- Exécuter le script généré depuis ton terminal PowerShell.
- Se rendre sur le navigateur web de la page SharePoint modifiée pour constater visuellement l'application du changement de texte/code.
