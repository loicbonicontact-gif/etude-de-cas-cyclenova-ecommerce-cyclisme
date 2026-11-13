-- BC01 Partie 2 : copie des 3 tables CycleNova dans BigQuery
-- Projet : epreuveblanche-514508
-- Dataset source : cyclenova_source (les 3 CSV importés)
-- Dataset de travail : cyclenova_travail (les copies)

-- ETAPE 1 : copier chaque table de la source vers le travail

-- Copie de la table produits
CREATE OR REPLACE TABLE `epreuveblanche-514508.cyclenova_travail.produits` AS
SELECT * FROM `epreuveblanche-514508.cyclenova_source.produits`;

-- Copie de la table ventes
CREATE OR REPLACE TABLE `epreuveblanche-514508.cyclenova_travail.ventes` AS
SELECT * FROM `epreuveblanche-514508.cyclenova_source.ventes`;

-- Copie de la table prix_concurrents
CREATE OR REPLACE TABLE `epreuveblanche-514508.cyclenova_travail.prix_concurrents` AS
SELECT * FROM `epreuveblanche-514508.cyclenova_source.prix_concurrents`;

-- ETAPE 2 : contrôler que chaque copie a autant de lignes que sa source

-- Contrôle produits : source puis copie
SELECT COUNT(*) AS nb_lignes FROM `epreuveblanche-514508.cyclenova_source.produits`;
SELECT COUNT(*) AS nb_lignes FROM `epreuveblanche-514508.cyclenova_travail.produits`;

-- Contrôle ventes : source puis copie
SELECT COUNT(*) AS nb_lignes FROM `epreuveblanche-514508.cyclenova_source.ventes`;
SELECT COUNT(*) AS nb_lignes FROM `epreuveblanche-514508.cyclenova_travail.ventes`;

-- Contrôle prix_concurrents : source puis copie
SELECT COUNT(*) AS nb_lignes FROM `epreuveblanche-514508.cyclenova_source.prix_concurrents`;
SELECT COUNT(*) AS nb_lignes FROM `epreuveblanche-514508.cyclenova_travail.prix_concurrents`;

-- Résultat attendu : produits 65 et 65, ventes 3005 et 3005, prix_concurrents 2818 et 2818
-- Si les deux chiffres sont les mêmes pour chaque table, la copie est bonne.
