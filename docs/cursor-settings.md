# Configuration Cursor — Paramètres et règles

Documentation des paramètres utilisateur Cursor (`settings.json`) et des **rules** appliquées à l’IA.  
Paramètres sur macOS : `~/Library/Application Support/Cursor/User/settings.json`.  
Règles utilisateur : `~/.cursor/rules/` (fichiers `.mdc`).

---

## Sommaire

1. [Paramètres (settings.json)](#paramètres-appliqués-pack-productivité)
2. [Règles Cursor (Rules)](#règles-cursor-rules)

---

## Prérequis

- Cursor installé
- Accès au fichier de paramètres utilisateur (modifiable depuis le chat ou **Cursor > Settings > Open User Settings (JSON)**)

---

## Paramètres appliqués (pack productivité)

### Qualité de code automatique

| Paramètre | Valeur | Rôle |
|-----------|--------|------|
| `editor.formatOnSave` | `true` | Reformate le code à chaque sauvegarde |
| `editor.codeActionsOnSave.source.fixAll` | `"always"` | Applique les corrections (lint, etc.) à la sauvegarde |
| `editor.codeActionsOnSave.source.organizeImports` | `"always"` | Réorganise les imports à la sauvegarde |
| `files.trimTrailingWhitespace` | `true` | Supprime les espaces en fin de ligne à la sauvegarde |
| `files.insertFinalNewline` | `true` | Insère une fin de ligne en fin de fichier à la sauvegarde |

### Confort de lecture

| Paramètre | Valeur | Rôle |
|-----------|--------|------|
| `editor.bracketPairColorization.enabled` | `true` | Colore les paires de parenthèses/accolades |
| `editor.guides.bracketPairs` | `true` | Affiche les guides verticaux pour les blocs |
| `editor.smoothScrolling` | `true` | Défilement fluide dans l’éditeur |
| `editor.stickyScroll.enabled` | `true` | Garde les en-têtes (fonctions, classes) visibles en haut |

### Complétion

| Paramètre | Valeur | Rôle |
|-----------|--------|------|
| `editor.suggestSelection` | `"first"` | Pré-sélectionne la première suggestion (moins de touches) |

### Terminal

| Paramètre | Valeur | Rôle |
|-----------|--------|------|
| `terminal.integrated.smoothScrolling` | `true` | Défilement fluide dans le terminal |
| `terminal.integrated.fontSize` | `13` | Taille de police du terminal |

**PATH dans le terminal :** Le terminal intégré hérite du PATH utilisateur Windows. Si Git ou Node n’est pas reconnu, vérifier que leur dossier est dans le PATH utilisateur (Paramètres Windows > Compte > Variables d’environnement), puis **redémarrer Cursor** pour que le nouveau PATH soit pris en compte.

### Explorateur

| Paramètre | Valeur | Rôle |
|-----------|--------|------|
| `explorer.compactFolders` | `false` | Affiche chaque dossier dans l’arbre (ex. `src/components` au lieu d’un seul nœud) |

---

## Paramètres préexistants conservés

| Paramètre | Valeur | Rôle |
|-----------|--------|------|
| `window.commandCenter` | `true` | Affiche le centre de commandes |
| `python.createEnvironment.trigger` | `"off"` | Désactive la création automatique d’environnement Python |
| `git.autofetch` | `true` | Récupération automatique des changements distants |
| `git.confirmSync` | `false` | Pas de confirmation avant sync |
| `diffEditor.maxComputationTime` | `0` | Pas de limite de temps pour les diffs (fichiers volumineux) |
| `editor.columnSelection` | `true` | Sélection en colonne (Alt + glisser) |
| `files.autoSave` | `"onFocusChange"` | Sauvegarde automatique à la perte de focus |
| `window.confirmBeforeClose` | `"always"` | Demande de confirmation avant fermeture |

---

## Règles Cursor (Rules)

Les rules sont des instructions persistantes que Cursor applique à l’assistant.  
Elles sont définies dans **`~/.cursor/rules/`** (fichiers `.mdc`) et éventuellement dans **`CLAUDE.md`** à la racine du projet.

### Règles toujours appliquées (`alwaysApply: true`)

Ces règles s’appliquent à chaque conversation, quel que soit le fichier ouvert.

#### 1. `communication.mdc`

**Description :** Langue et style de communication.

**Instructions :**
- Toujours répondre en français
- Expliquer les termes techniques en français
- Utiliser des exemples adaptés au contexte francophone

---

#### 2. `synthese-avancement.mdc`

**Description :** Fournir des synthèses régulières de l’avancement du projet.

**Quand faire une synthèse :**
- Après avoir complété une étape majeure du projet
- Toutes les 3–4 modifications significatives
- Avant de passer à une nouvelle fonctionnalité
- À la demande de l’utilisateur

**Format attendu :**

```markdown
## 📊 Point d'avancement

### ✅ Ce qui est fait
- [Liste des fonctionnalités/étapes complétées]

### 🔄 En cours
- [Ce sur quoi on travaille actuellement]

### 📋 Prochaines étapes
- [Les 2-3 prochaines tâches à réaliser]

### ⚠️ Points d'attention (si applicable)
- [Problèmes rencontrés ou décisions à prendre]
```

**Bonnes pratiques :**
- Langage simple et accessible
- Être concis mais complet
- Mettre en valeur les progrès pour motiver
- Toujours donner de la visibilité sur la suite

---

### Règles appliquées par type de fichier (`globs`)

Ces règles ne s’appliquent que lorsque des fichiers correspondant aux globs sont concernés (ouverts, modifiés ou dans le contexte).

#### 3. `documentation.mdc`

| Propriété | Valeur |
|-----------|--------|
| **Cible** | `**/*.md` |
| **Description** | Style de documentation du projet |

**Instructions :**
- Écrire en français
- Inclure des exemples de code
- Structurer avec des titres clairs (H1, H2, H3)
- Ajouter une section « Prérequis » si nécessaire

---

#### 4. `python-standards.mdc`

| Propriété | Valeur |
|-----------|--------|
| **Cible** | `**/*.py` |
| **Description** | Conventions Python pour le projet |

**Instructions :**
- Utiliser des docstrings pour toutes les fonctions
- Noms de variables en `snake_case`
- Maximum 80 caractères par ligne

**Exemple attendu :**

```python
# ❌ MAUVAIS
def f(x):
    return x*2

# ✅ BON
def doubler_valeur(nombre: int) -> int:
    """Multiplie un nombre par deux."""
    return nombre * 2
```

---

#### 5. `react-patterns.mdc`

| Propriété | Valeur |
|-----------|--------|
| **Cible** | `**/*.tsx` |
| **Description** | Patterns React pour les composants |

**Instructions :**
- Utiliser des composants fonctionnels
- Typer tous les props avec TypeScript
- Un composant par fichier

**Exemple attendu :**

```tsx
// ❌ MAUVAIS
function btn(p) {
  return <button>{p.t}</button>
}

// ✅ BON
interface ButtonProps {
  label: string;
  onClick: () => void;
}

export function Button({ label, onClick }: ButtonProps) {
  return <button onClick={onClick}>{label}</button>;
}
```

---

#### 6. `testing.mdc`

| Propriété | Valeur |
|-----------|--------|
| **Cible** | `**/*.test.ts` |
| **Description** | Conventions pour les tests unitaires |

**Instructions :**
- Nommer les tests de façon descriptive
- Un seul concept testé par test
- Utiliser la structure Arrange-Act-Assert

**Exemple attendu :**

```typescript
describe('Calculator', () => {
  it('devrait additionner deux nombres positifs', () => {
    // Arrange
    const a = 5;
    const b = 3;
    // Act
    const result = add(a, b);
    // Assert
    expect(result).toBe(8);
  });
});
```

---

#### 7. `api-conventions.mdc`

| Propriété | Valeur |
|-----------|--------|
| **Cible** | `**/api/**/*.ts` |
| **Description** | Conventions pour les endpoints API |

**Instructions :**
- Utiliser les verbes HTTP corrects (GET, POST, PUT, DELETE)
- Toujours retourner des codes de statut appropriés
- Valider les entrées utilisateur

**Exemple attendu :**

```typescript
app.post('/users', async (req, res) => {
  try {
    const validated = validateUserInput(req.body);
    const user = await createUser(validated);
    res.status(201).json(user);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
});
```

---

### Règle workspace (projet)

| Fichier | Rôle |
|---------|------|
| **`CLAUDE.md`** (racine du repo) | Instructions IA du projet BMAD Fast & Auto : méthode, artefacts, commandes Cursor, snippets chat, documentation, outils installés. Toujours prise en compte dans ce workspace. |

---

## Historique

- **Fév. 2025** — Application du pack recommandé (paramètres) et création de cette documentation.
- **Fév. 2025** — Ajout de la section détaillée sur les rules Cursor (`~/.cursor/rules/`).

---

## Références

- [Documentation VS Code - User and Workspace Settings](https://code.visualstudio.com/docs/getstarted/settings)
- Règles utilisateur : `~/.cursor/rules/*.mdc`
- Règle workspace : `CLAUDE.md` (racine du projet)
