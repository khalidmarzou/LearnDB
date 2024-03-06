SELECT
  COUNT(nomv) AS countVendeur,
  nomv
FROM
  vente
WHERE
  dateVente>'2023-10-20'
GROUP BY
  nomv
ORDER BY
  countVendeur DESC
LIMIT
  1;