

## Contenu et consignes

- `SUJET_Epreuve_Blanche_CycleNova.docx` : consignes des blocs BC01, BC02, BC03, BC04 et BC06, y compris les 29 QCM (14 d'origine + 15 supplémentaires).
- `DONNEES/produits.csv`, `DONNEES/ventes.csv`, `DONNEES/prix_concurrents.csv` : jeux fictifs à auditer ; fichiers encodés en UTF-8, séparateur virgule, dates ISO `AAAA-MM-JJ`, décimales avec un point.
- `NOTEBOOKS/BC01_challenge_SQL.ipynb`, `NOTEBOOKS/BC02_EDA_Statistiques.ipynb`, `NOTEBOOKS/BC03_Machine_Learning.ipynb` : trois notebooks candidats distincts, avec cellules de réponse et consignes.
- `SQL/BC01_Partie2_Modele_BigQuery.sql` : aide syntaxique **sans les réponses** pour la copie des tables BigQuery.

## Granularité et colonnes

`produits.csv` : **une ligne attendue par produit** ; `id_produit` (clé métier), `nom_produit`, `categorie`, `marque`, `prix_catalogue` (EUR), `cout_unitaire` (EUR), `actif` (0/1).

`ventes.csv` : **une ligne par vente de produit**, `id_vente` (clé attendue), `date_commande`, `id_produit`, `quantite`, `prix_unitaire` (EUR), `taux_remise` (fraction de 0 à 1), `code_promo` (vide si absent), `canal`, `retour` (1=retourné, 0=non retourné), `date_retour` et `motif_retour` (connus *après* la commande).

`prix_concurrents.csv` : **un relevé par (id_produit, concurrent, date_releve)**, avec `prix_concurrent` en EUR. Plusieurs relevés pour un même produit sont normaux. Pour comparer les prix courants, il faut déterminer quel relevé est pertinent **par produit et par concurrent** ; ne joignez pas directement tout l'historique à `ventes`.

Les données contiennent délibérément des erreurs (doublons, clés manquantes/inconnues, valeurs non valides). **Ne supposez pas que tous les enregistrements sont valides.** Avant un agrégat, justifiez les règles de correction ou d'exclusion. Le taux de retour se calcule sur le nombre de lignes de vente valides avec étiquette connue ; le chiffre d'affaires brut de ventes est **hors remboursement** et **après remise**. Les dates 2025 servent au développement du modèle, les dates 2026 au test final.

## Utilisation locale ou Google Colab

1. Décompresser l'archive entière, **sans déplacer les fichiers par rapport aux dossiers**.
2. Ouvrir les trois notebooks depuis le dossier `NOTEBOOKS` dans Jupyter/VS Code. Ils recherchent automatiquement `../DONNEES`.
3. Dans Google Colab : importer l'archive ZIP dans `/content` (menu Fichiers), ouvrir le notebook choisi dans Colab puis exécuter sa première cellule de code. Cette cellule détecte et décompresse l'archive présente dans `/content` si nécessaire.
4. Les notebooks s'appuient sur `pandas`, `numpy`, `matplotlib`, `scipy`, `scikit-learn` et `sqlite3` (inclus dans Python). Pas besoin d'une clé API ni d'une base distante pour les parties 3/2/2.
5. **BC01 Partie 2** : BigQuery est demandé comme dans la référence ; vous devez disposer de votre propre projet Google Cloud (ou demander une alternative locale à l'enseignant si l'environnement BigQuery n'est pas accessible).

## Livrables

Reprendre dans le document les réponses aux QCM/questions ouvertes et indiquer les liens/fichiers demandés : présentations, fichier SQL/capture, 3 notebooks, vidéo 3–5 minutes et dashboard PDF. Les notebooks fournis sont des supports de travail, **pas les solutions**.

## Note de confidentialité

Données synthétiques ; aucune donnée client ou identifiable réelle n'est fournie. Les questions RGPD restent théoriques.
