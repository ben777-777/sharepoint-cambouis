<#
.SYNOPSIS
    Script complet pour modifier une page SharePoint Online moderne depuis Antigravity via PnP PowerShell.

.DESCRIPTION
    Sharepoint Cambouis - Outil de mise à jour automatisé de sites.
    Ce script :
    1. S'authentifie interactivement au tenant SharePoint cible.
    2. Récupère la page "Site Page" spécifiée.
    3. Ajoute ou modifie un composant de texte sur la page avec des balises HTML.
    4. Sauvegarde et publie les modifications avec commentaire de révision.

.PARAMETER SiteUrl
    L'URL absolue du site SharePoint cible (ex: https://TENANT.sharepoint.com/sites/MonSite).

.PARAMETER ClientId
    L'identifiant d'application (Client ID) de votre application Entra ID enregistrée. Requis pour PnP PowerShell.

.PARAMETER PageName
    Le nom de la page à modifier (ex: Accueil.aspx ou l'URL relative de la page).

.PARAMETER Content
    Le code HTML ou Texte à injecter à la volée. Par défaut, un encart de test.

.EXAMPLE
    .\edit-sharepoint-page.ps1 -SiteUrl "https://contoso.sharepoint.com/sites/mon-site" -ClientId "1234abcd-..." -PageName "Accueil.aspx"

.EXAMPLE
    .\edit-sharepoint-page.ps1 -SiteUrl "https://contoso.sharepoint.com/sites/mon-site" -ClientId "1234abcd-..." -PageName "Index.aspx" -Content "<h1>Nouveau Titre</h1>"

.NOTES
    Auteur: Antigravity (B_ARNAUD) / Flash
    Date: 25/02/2026
    Documentation: Voir docs/guide-sharepoint-cambouis.md
#>

param (
    [Parameter(Mandatory = $true, HelpMessage = "L'URL du site SharePoint (ex: https://TENANT.sharepoint.com/sites/MonSite)")]
    [string]$SiteUrl,

    [Parameter(Mandatory = $true, HelpMessage = "L'ID de l'application Entra ID pour l'authentification PnP")]
    [string]$ClientId,

    [Parameter(Mandatory = $true, HelpMessage = "Le nom de la page (ex: Accueil.aspx ou l'URL relative de la page)")]
    [string]$PageName,

    [Parameter(Mandatory = $false, HelpMessage = "Le texte HTML ou Markdown à injecter")]
    [string]$Content = "<h2>Mise à jour automatique</h2><p>Ce contenu a été généré via Antigravity et PnP PowerShell !</p>"
)

# 1. Connexion au Site
Write-Host "Connexion à SharePoint ($SiteUrl)..." -ForegroundColor Cyan
try {
    # On utilise l'interactive par défaut, modifiable en -DeviceLogin pour des sessions full CLI
    Connect-PnPOnline -Url $SiteUrl -Interactive -ClientId $ClientId -ErrorAction Stop
    Write-Host "[OK] Connecté avec succès." -ForegroundColor Green
}
catch {
    Write-Error "Échec de la connexion. Vérifiez l'URL, le Client ID et vos autorisations."
    exit 1
}

# 2. Récupération de la Page
Write-Host "Récupération de la page : $PageName..." -ForegroundColor Cyan
try {
    $page = Get-PnPClientSidePage -Identity $PageName -ErrorAction Stop
    Write-Host "[OK] Page '$($page.PageTitle)' trouvée." -ForegroundColor Green
}
catch {
    Write-Error "Impossible de trouver la page '$PageName'. Assurez-vous qu'elle existe."
    Disconnect-PnPOnline
    exit 1
}

# 3. Modification de la page
Write-Host "Modification du contenu de la page..." -ForegroundColor Cyan
try {
    # On ajoute un composant texte à la fin de la page principale (section 1, colonne 1)
    # Tu peux adapter la logique ici (ex: rechercher un composant existant et le MAJ)
    Add-PnPClientSideText -Page $page -Text $Content | Out-Null
    Write-Host "[OK] Composant texte injecté." -ForegroundColor Green
}
catch {
    Write-Error "Erreur lors de l'ajout du composant texte : $_"
    Disconnect-PnPOnline
    exit 1
}

# 4. Enregistrement et Publication
Write-Host "Sauvegarde et publication..." -ForegroundColor Cyan
try {
    # Sauvegarder la page modifiée
    $page.Save()
    # Publier pour la rendre visible par les visiteurs
    $page.Publish("Mise à jour automatisée par script PnP")
    Write-Host "[OK] Page sauvegardée et publiée avec succès." -ForegroundColor Green
}
catch {
    Write-Error "Impossible de sauvegarder ou de publier la page : $_"
}
finally {
    # 5. Déconnexion
    Disconnect-PnPOnline
    Write-Host "Déconnexion de SharePoint effectuée." -ForegroundColor Gray
}

Write-Host "Opération terminée." -ForegroundColor Cyan
