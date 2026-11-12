-- BC06 : requête utilisée comme source du dashboard Looker Studio (BigQuery)
-- Elle applique les mêmes règles de nettoyage que le BC01, pour ne pas compter deux fois une vente.

-- 1) Produits sans doublon : une seule ligne par produit
WITH p AS (
  SELECT DISTINCT id_produit, categorie
  FROM `epreuveblanche-514508.cyclenova_travail.produits`
)
-- 2) Ventes valides : une ligne par vente (DISTINCT enlève les copies exactes)
SELECT DISTINCT
  v.id_vente,
  CAST(v.date_commande AS DATE) AS date_commande,
  DATE_TRUNC(CAST(v.date_commande AS DATE), MONTH) AS mois,          -- sert au graphique mensuel
  v.id_produit,
  p.categorie,
  v.quantite,
  v.prix_unitaire,
  v.taux_remise,
  COALESCE(NULLIF(TRIM(v.code_promo), ''), 'Sans promo') AS code_promo,   -- vide = pas de promotion
  COALESCE(NULLIF(TRIM(v.canal), ''), 'Non renseigné') AS canal,
  CAST(v.retour AS INT64) AS retour,                                   -- 1 = retourné, 0 = non retourné
  v.motif_retour,
  ROUND(v.quantite * v.prix_unitaire * (1 - v.taux_remise), 2) AS montant,   -- montant après remise
  IF(CAST(v.retour AS INT64) = 0,
     ROUND(v.quantite * v.prix_unitaire * (1 - v.taux_remise), 2), 0) AS ca_net   -- CA hors remboursements
FROM `epreuveblanche-514508.cyclenova_travail.ventes` v
JOIN p ON v.id_produit = p.id_produit        -- enlève les id_produit vides ou inconnus
WHERE v.quantite > 0
  AND v.prix_unitaire > 0
  AND v.taux_remise BETWEEN 0 AND 1
  AND CAST(v.retour AS INT64) IN (0, 1);
