-- vtex_captacao_sources_distintos_v2

SELECT 

--Busca Paga - Google
CASE WHEN lower(source_unificada) = "google" and lower(medium_unificada) = "cpc" then
     --PLA
     
     CASE WHEN lower(campaign_unificada) LIKE "%pla%" AND LOWER(campaign_unificada) LIKE "%coop%" THEN "PLA Cooperado"
     WHEN lower(campaign_unificada) LIKE "%pla%" THEN "PLA"
     WHEN campaign_unificada LIKE "%not set%" THEN "PLA" 
     
     --Branding
     WHEN campaign_unificada LIKE "%sl-%" THEN "Branding" 
     WHEN campaign_unificada LIKE "%sl_%" THEN "Branding" 
     WHEN lower(campaign_unificada) LIKE "%brand%" THEN "Branding"
     WHEN campaign_unificada LIKE "%[BRAND]%" THEN "Branding" 
     WHEN campaign_unificada LIKE "%[BA]%" THEN "Branding" 

     --ShowCase
     WHEN campaign_unificada LIKE "%Showcase%" THEN "Showcase" 
     WHEN campaign_unificada LIKE "%showcase%" THEN "Showcase" 

     --DSA
     WHEN campaign_unificada LIKE "%[DSA]%" THEN "DSA"
     WHEN campaign_unificada = "dsa" THEN "DSA" 

      --Sazonal
     WHEN campaign_unificada LIKE "%[SAZ]%" THEN "SAZONAL" 
     WHEN campaign_unificada LIKE "%sepha%" THEN "SAZONAL" 
     WHEN campaign_unificada LIKE "%[CUPOM]%" THEN "SAZONAL" 
     WHEN campaign_unificada LIKE "%[SAZONAL]%" THEN "SAZONAL" 

     --DRA
     WHEN campaign_unificada LIKE "%[DRA]%" THEN "DRA" 
     WHEN campaign_unificada LIKE "%dra%" THEN "DRA" 

     -- COOP
     WHEN campaign_unificada LIKE "%[COOP] [SEARCH]%" THEN "Search Cooperado" 
     WHEN campaign_unificada LIKE "%COOP%" THEN "PLA Cooperado" 
     WHEN campaign_unificada LIKE "%[FORNECEDOR]%" THEN "PLA Cooperado" 
    
     ELSE "Google CPC Outros"
     END

WHEN source_unificada = "pla"  THEN "PLA" 

-- Retargeting

-- Criteo
WHEN source_unificada LIKE "%criteo%" or medium_unificada LIKE "%criteo%"  THEN 
    CASE WHEN medium_unificada LIKE "%eads%" THEN "Criteo Cooperado"
    Else "Criteo" 
    End
    
-- RTB
WHEN source_unificada LIKE "%rtbhouse%"  THEN 
    CASE WHEN medium_unificada LIKE "%eads%" THEN "RTB Cooperado"
    Else "RTB" 
    End

--Afiliados

WHEN source_unificada LIKE "%comparadores%" AND medium_unificada LIKE "%zoom%" THEN "Zoom"
WHEN source_unificada LIKE "%awin%" AND medium_unificada LIKE "%1006251%" THEN "Banco do Brasil SA"
WHEN source_unificada LIKE "%awin%" AND medium_unificada LIKE "%638667%" THEN "Dotz"
WHEN source_unificada LIKE "%awin%" AND medium_unificada LIKE "%816517%" THEN "Banco BMG S.A."
WHEN source_unificada LIKE "%awin%" AND medium_unificada LIKE "%948025%" THEN "Banco Original"
WHEN source_unificada LIKE "%awin%" AND medium_unificada LIKE "%689223%" THEN "Banco Inter Afiliados"
WHEN source_unificada LIKE "%awin%" AND medium_unificada LIKE "%667909%" THEN "Desconto Cupom"
WHEN source_unificada LIKE "%awin%" AND medium_unificada LIKE "%884473%" THEN "Picpay Servicos S.A"
WHEN source_unificada LIKE "%awin%" AND medium_unificada LIKE "%802303%" THEN "Banco XP"
WHEN source_unificada LIKE "%awin%" AND medium_unificada LIKE "%782517%" THEN "PagBank"
WHEN source_unificada LIKE "%awin%" AND medium_unificada LIKE "%638421%" THEN "Cupomvalido"
WHEN source_unificada LIKE "%awin%" AND medium_unificada LIKE "%638647%" THEN "GSG Brasil"
WHEN source_unificada LIKE "%awin%" AND medium_unificada LIKE "%197989%" THEN "Meliuz"
WHEN source_unificada LIKE "%awin%" AND medium_unificada LIKE "%402367%" THEN "Cuponomia"

WHEN source_unificada LIKE "%awin%"  THEN "Awin"
WHEN source_unificada LIKE "%zanox%"  THEN 
    CASE WHEN medium_unificada LIKE "%meliuz%" THEN "Meliuz"
    Else "Zanox" 
    End

--Multiplus
WHEN source_unificada LIKE "%multiplus%"  THEN "Multiplus"

--Dotz
WHEN source_unificada = "dotz"  THEN "Dotz"

--Meliuz
WHEN source_unificada LIKE "%meliuz%"  THEN "Meliuz"

--Liquida_beauty
WHEN source_unificada = "liquidabeauty"  and medium_unificada="site" THEN "Liquida Beauty"

--Bing
WHEN source_unificada = "bing" and medium_unificada="cpc" THEN "Bing Pago"

--Comparadores
WHEN medium_unificada = "comparadores" THEN "Comparadores"

--SEO
WHEN medium_unificada = "organic" THEN
     Case When source_unificada = "google" THEN "Google Orgânico"
     When source_unificada = "ask" THEN "Ask Orgânico"
     When source_unificada = "bing" THEN "Bing Orgânico"
     When source_unificada = "yahoo" THEN "Yahoo Orgânico"
     ELSE "Outros Orgânico"
     END
WHEN source_unificada = "google" and medium_unificada is null THEN "Google Orgânico"
WHEN source_unificada = "google" and medium_unificada = "" THEN "Google Orgânico"

--Direto
WHEN source_unificada = "(direct)" THEN "Direto"
WHEN source_unificada = "" AND medium_unificada = "" AND campaign_unificada = "" THEN "Direto"

--Referral
WHEN medium_unificada = "referral" THEN "Referral"

--Tik Tok
WHEN source_unificada LIKE "%tik-tok%" THEN 

    --Tik Tok - DSA
     Case WHEN campaign_unificada LIKE "%dsa%" THEN "Tik Tok - DSA"
     WHEN campaign_unificada LIKE "%install%" THEN "Tik Tok - App Install"
     WHEN medium_unificada LIKE "%tik-tok%" AND campaign_unificada LIKE "%branding%" THEN "Tik Tok - Branding"
     ELSE "Outros Tik Tok"
     END
WHEN source_unificada LIKE "%branding%" AND medium_unificada LIKE "%tik-tok%" THEN "Tik Tok - Branding"

--Programatica
WHEN source_unificada LIKE "%programatica%" AND medium_unificada LIKE "%uol%" THEN "UOL"
WHEN source_unificada LIKE "%programatica%" AND medium_unificada LIKE "%clar%" THEN "CLARO"
WHEN source_unificada LIKE "%dv360%" AND (medium_unificada = "" OR medium_unificada = "(not set)") THEN "Programatica Branding"

--Youtube
WHEN source_unificada LIKE "%youtube%" AND medium_unificada LIKE "%google%" THEN "Youtube"

--Uol
WHEN source_unificada LIKE "%uol%" AND medium_unificada LIKE "%programatica%" THEN "Uol Branding"

--Facebook
WHEN source_unificada LIKE "%facebook%" or source_unificada LIKE "%fb%" or source_unificada = "ig" or source_unificada = "instagram" THEN 

    --FB brand
     Case When medium_unificada LIKE "%patrocinado" THEN "Post Patrocinado"
     When medium_unificada LIKE "%organico%" THEN "Post Orgânico"
     When medium_unificada LIKE "%stories%" THEN "Stories"
     When medium_unificada LIKE "%video%" THEN "Vídeos"
     When medium_unificada LIKE "%brand%" THEN "FB - Branding"

     When medium_unificada LIKE "%eads%" THEN "Facebook Ads Cooperado"
     When medium_unificada LIKE "%collabads%" THEN "Facebook Collab"
     When source_unificada LIKE "%dpa%" THEN "DPA"
     
     --FB performance
     When medium_unificada LIKE "%socialads" THEN
          CASE 
          WHEN LOWER(campaign_unificada) LIKE "%branding%" THEN "FB - Branding"
          WHEN LOWER(campaign_unificada) LIKE "%promocao%" THEN "FB - Promoção"
          WHEN LOWER(campaign_unificada) LIKE "%conversao%" THEN "DPA"
          WHEN LOWER(campaign_unificada) LIKE "%daba%" THEN "DABA"
          WHEN LOWER(campaign_unificada) LIKE "%fornecedor%" THEN "FB - Fornecedor"
          WHEN LOWER(campaign_unificada) LIKE "%trafego%" THEN "FB - Tráfego"
          WHEN LOWER(campaign_unificada) LIKE "%alcance%" THEN "FB - Alcance"
          WHEN LOWER(campaign_unificada) LIKE "%aquisicao%" THEN "FB - Aquisição"
          WHEN LOWER(campaign_unificada) LIKE "%engajamento%" THEN "FB - Engajamento"
          WHEN LOWER(campaign_unificada) LIKE "%_always%" THEN "Always ON"
          WHEN LOWER(campaign_unificada) LIKE "%dpa%" THEN "DPA"
          ELSE "DPA" 
          END      
     When medium_unificada LIKE "%plano-fb" THEN "FB Interesses" 
     ELSE "Outros Facebook"
     END

--E-mail
WHEN source_unificada LIKE "%ALLIN%" or source_unificada LIKE "%BTG%" or source_unificada LIKE "%allin%" or source_unificada = "vtex" THEN

     CASE WHEN campaign_unificada LIKE "%NAVEGACAODIARIA%" THEN "Navegação Diária"
     WHEN campaign_unificada LIKE "%NAVEGACAOSEMANAL%" THEN "Navegação Semanal"
     WHEN campaign_unificada LIKE "%NAVEGACAOMENSAL%" THEN "Navegação Mensal"
     WHEN campaign_unificada LIKE "%FAVORITOS%" THEN "Favoritos"
     WHEN campaign_unificada LIKE "%NOVIDADES%" THEN "Novidades"
     WHEN campaign_unificada LIKE "%BTG360_POSCOMPRA%" THEN "Pós Compra"
     WHEN campaign_unificada LIKE "%BTG360RECORRENCIA%" THEN "Recorrência"
     WHEN campaign_unificada LIKE "%BTG360DECIDIDOS%" THEN "Decididos"
     WHEN campaign_unificada LIKE "%BTGINATIVOS%" THEN "Inativos"
     WHEN campaign_unificada LIKE "%BTGINDECISOS%" THEN "Indecisos"
     WHEN campaign_unificada LIKE "%BTG360ABCAR%" THEN "Abandono de Carrinho"
     WHEN campaign_unificada LIKE "%BTG360ABPROD%" THEN "Abandono de Produto"
     WHEN campaign_unificada LIKE "%BTG360PRECO%" THEN "Redução de Preço"
     WHEN campaign_unificada LIKE "%EXTRA%" THEN "E-Mail Extra"
     WHEN campaign_unificada LIKE "%CONQUISTA%" THEN "Reconquista"
     WHEN campaign_unificada LIKE "%vindas%" THEN "Boas Vindas"
     WHEN campaign_unificada LIKE "%VINDAS%" THEN "Boas Vindas"
     WHEN campaign_unificada LIKE "%transacional%" THEN "Transacional"
     WHEN campaign_unificada LIKE "%EM_%" THEN "Tradicional"
     ELSE "Outros E-mail" 
     END
     
WHEN source_unificada LIKE "emaildaepoca"  THEN "Resgate Inativos"
WHEN source_unificada LIKE "VENDAVALIDA"  THEN "Resgate Boletos"

--Trade

WHEN source_unificada = "rica-de-marre-storeis"  THEN "Rica de Marre"
WHEN source_unificada = "makeupatelier"  THEN "MakeUp Atelier"
WHEN source_unificada = "euvouderosa"  THEN "Vou de Rosa"
WHEN source_unificada = "beauty"  THEN "2Beuaty"
WHEN source_unificada = "2beauty"  THEN "2Beuaty"
WHEN source_unificada = "socialorganico"  THEN "Social Brand"
WHEN source_unificada = "socialbuy"  THEN "Social Buy"
WHEN source_unificada = "instaby"  THEN "Insta By"
WHEN source_unificada = "perfumart"  THEN "Perfumart"
WHEN source_unificada = "cheiro"  THEN "Cheiro"
WHEN source_unificada = "pausaparafeminices"  THEN "Pausa para Feminicies"
WHEN source_unificada = "perfumolatras"  THEN "Perfumolatras"
WHEN source_unificada = "belezaExtraordinaria"  THEN "Beleza Extraordinaria"
WHEN source_unificada = "bisou-site"  THEN "Bisou"
WHEN source_unificada = "viceridono"  THEN "Viceridono"
WHEN source_unificada LIKE "luizarossi%"  THEN "Luiza Rossi"
WHEN source_unificada = "pl_thaysvita"  THEN "Thays Vita"
WHEN source_unificada = "instagrambrand"  THEN "Instagram"
WHEN source_unificada = "shampoodelaranja"  THEN "Shampoo de Laranja"
WHEN source_unificada LIKE "%futlish%"  THEN "Futlish"
WHEN source_unificada = "paraisoFeminino"  THEN "Paraiso Feminino"
WHEN source_unificada = "st_yasminbrunet"  THEN "Yasmin Brunet"
WHEN source_unificada LIKE "pb_%"  THEN "Blogueiras Comissionadas"
WHEN source_unificada LIKE "pbs_%"  THEN "Blogueiras Sem Comissão"
WHEN source_unificada LIKE "fornecedor_%"  THEN "Blogueiras Sem Comissão"
WHEN source_unificada LIKE "fh_%"  THEN "Fhits"
WHEN source_unificada LIKE "%site%"  THEN "Fornecedor"
WHEN medium_unificada LIKE "%trade%"  THEN "Fornecedor"


--Direcionamento
WHEN source_unificada LIKE "%dv360%" AND medium_unificada LIKE "%cp%" THEN "Direcionamento"
WHEN source_unificada LIKE "%dv360%" AND medium_unificada LIKE "%eads%" THEN "Direcionamento"
WHEN source_unificada LIKE "%tiktok%" AND medium_unificada LIKE "%eads%" THEN "Direcionamento"
WHEN source_unificada LIKE "%outros_midia%" AND medium_unificada LIKE "%eads%" THEN "Direcionamento"
WHEN source_unificada LIKE "%midia-youtube%" AND medium_unificada LIKE "%eads%" THEN "Direcionamento"
WHEN source_unificada LIKE "%youtube-elseve%" AND medium_unificada LIKE "%eads%" THEN "Direcionamento"
WHEN source_unificada = "google" AND medium_unificada LIKE "%eads%" THEN "Direcionamento"
WHEN source_unificada LIKE "%yt%" AND source_unificada NOT LIKE "%fb%" AND medium_unificada LIKE "%eads%" THEN "Direcionamento"


ELSE "Outros Vtex"

End as Subcanal_BQ,


source_unificada,medium_unificada, campaign_unificada



FROM (--Seleciona a combinação de source, medium e campaings distindos usando base do GA, Hook e Feed
SELECT
  DISTINCT trim(ga_source) AS source_unificada,
  trim(ga_medium) AS medium_unificada,
  trim(ga_campaign) AS campaign_unificada
FROM (
  SELECT
    DISTINCT 
    trim(ga_source) as ga_source,
    trim(ga_medium) as ga_medium,
    trim(ga_campaign) as ga_campaign
  FROM
    `epoca-230913.VTEX.captacao_feed_v1_v3_ga_v3`
  UNION ALL
  SELECT
    DISTINCT 
    trim(utmSource),
    trim(utmMedium),
    trim(utmCampaign)
  FROM
    `epoca-230913.VTEX.captacao_feed_v1_v3_ga_v3`
  UNION ALL
  SELECT
    DISTINCT
    trim(utmSource),
    trim(utmMedium),
    trim(utmCampaign)
  FROM
    `epoca-230913.VTEX.captacao_pedidos_tb_hook_v1`
      UNION ALL
  SELECT
    DISTINCT trim(source),
    trim(medium),
    trim(campaign)
  FROM
    `epoca-230913.GA.bd_visitas_mainDataset`
  UNION ALL
  SELECT
    DISTINCT trim(source),
    trim(medium),
    trim(campaign)
  FROM
    `epoca-230913.GA.origem_pedido_ga_full`
  UNION ALL
  SELECT
      DISTINCT 
    CASE WHEN trim(source) IS NULL then utmSource ELSE trim(source) END AS source,
    CASE WHEN trim(medium) IS NULL then utmMedium ELSE trim(medium) END AS medium,
    CASE WHEN trim(campaign) IS NULL then utmCampaign ELSE trim(campaign) END AS campaign
  FROM
    `epoca-230913.analytics_174612431.origem_pedido_ga4_full` ga
  LEFT JOIN
    `epoca-230913.VTEX.captacao_pedidos_tb_hook_v1` vtex
  ON
    ga.transaction_id = vtex.orderId))

group by 1,2,3,4
