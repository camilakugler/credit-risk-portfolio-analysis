-- vw_concessoes_anuais
CREATE OR REPLACE VIEW public.vw_concessoes_anuais AS  SELECT EXTRACT(year FROM issue_d) AS ano,
    count(*) AS total_emprestimos,
    sum(funded_amnt) AS valor_total_financiado
   FROM emprestimos_lending_club
  GROUP BY (EXTRACT(year FROM issue_d))
  ORDER BY (EXTRACT(year FROM issue_d));;

-- vw_status_por_ano
CREATE OR REPLACE VIEW public.vw_status_por_ano AS  SELECT EXTRACT(year FROM issue_d) AS ano,
    loan_status,
    count(*) AS total_contratos
   FROM emprestimos_lending_club
  WHERE loan_status::text = ANY (ARRAY['Fully Paid'::character varying, 'Charged Off'::character varying]::text[])
  GROUP BY (EXTRACT(year FROM issue_d)), loan_status
  ORDER BY (EXTRACT(year FROM issue_d)), loan_status;;

-- vw_percentual_perdas_anuais
CREATE OR REPLACE VIEW public.vw_percentual_perdas_anuais AS  SELECT ano,
    round(100.0 * sum(
        CASE
            WHEN loan_status::text = 'Charged Off'::text THEN total_contratos
            ELSE 0::bigint
        END) / sum(total_contratos), 2) AS percentual_perdas
   FROM vw_status_por_ano
  GROUP BY ano
  ORDER BY ano;;

-- vw_perdas_por_grade
CREATE OR REPLACE VIEW public.vw_perdas_por_grade AS  SELECT grade,
    count(*) AS total_contratos,
    count(*) FILTER (WHERE loan_status::text = 'Charged Off'::text) AS contratos_perda,
    round(100.0 * count(*) FILTER (WHERE loan_status::text = 'Charged Off'::text)::numeric / count(*)::numeric, 2) AS percentual_perdas
   FROM emprestimos_lending_club
  WHERE loan_status::text = ANY (ARRAY['Fully Paid'::character varying, 'Charged Off'::character varying]::text[])
  GROUP BY grade
  ORDER BY grade;;

-- vw_perdas_por_dti
CREATE OR REPLACE VIEW public.vw_perdas_por_dti AS  WITH contratos AS (
         SELECT emprestimos_lending_club.loan_status,
                CASE
                    WHEN emprestimos_lending_club.dti < 10::numeric THEN '1. Abaixo de 10%'::text
                    WHEN emprestimos_lending_club.dti < 20::numeric THEN '2. De 10% a 20%'::text
                    WHEN emprestimos_lending_club.dti < 30::numeric THEN '3. De 20% a 30%'::text
                    ELSE '4. Acima de 30%'::text
                END AS faixa_dti
           FROM emprestimos_lending_club
          WHERE emprestimos_lending_club.dti IS NOT NULL AND (emprestimos_lending_club.loan_status::text = ANY (ARRAY['Fully Paid'::character varying, 'Charged Off'::character varying]::text[]))
        )
 SELECT faixa_dti,
    count(*) AS total_contratos,
    count(*) FILTER (WHERE loan_status::text = 'Charged Off'::text) AS contratos_perda,
    round(100.0 * count(*) FILTER (WHERE loan_status::text = 'Charged Off'::text)::numeric / count(*)::numeric, 2) AS percentual_perdas
   FROM contratos
  GROUP BY faixa_dti
  ORDER BY faixa_dti;;

-- vw_perdas_por_juros
CREATE OR REPLACE VIEW public.vw_perdas_por_juros AS  WITH contratos AS (
         SELECT emprestimos_lending_club.loan_status,
                CASE
                    WHEN emprestimos_lending_club.int_rate < 10::numeric THEN '1. Abaixo de 10%'::text
                    WHEN emprestimos_lending_club.int_rate < 15::numeric THEN '2. De 10% a 15%'::text
                    WHEN emprestimos_lending_club.int_rate < 20::numeric THEN '3. De 15% a 20%'::text
                    ELSE '4. Acima de 20%'::text
                END AS faixa_juros
           FROM emprestimos_lending_club
          WHERE emprestimos_lending_club.loan_status::text = ANY (ARRAY['Fully Paid'::character varying, 'Charged Off'::character varying]::text[])
        )
 SELECT faixa_juros,
    count(*) AS total_contratos,
    count(*) FILTER (WHERE loan_status::text = 'Charged Off'::text) AS contratos_perda,
    round(100.0 * count(*) FILTER (WHERE loan_status::text = 'Charged Off'::text)::numeric / count(*)::numeric, 2) AS percentual_perdas
   FROM contratos
  GROUP BY faixa_juros
  ORDER BY faixa_juros;;

-- vw_perdas_por_finalidade
CREATE OR REPLACE VIEW public.vw_perdas_por_finalidade AS  SELECT purpose,
    count(*) AS total_contratos,
    count(*) FILTER (WHERE loan_status::text = 'Charged Off'::text) AS contratos_perda,
    round(100.0 * count(*) FILTER (WHERE loan_status::text = 'Charged Off'::text)::numeric / count(*)::numeric, 2) AS percentual_perdas
   FROM emprestimos_lending_club
  WHERE loan_status::text = ANY (ARRAY['Fully Paid'::character varying, 'Charged Off'::character varying]::text[])
  GROUP BY purpose
  ORDER BY (round(100.0 * count(*) FILTER (WHERE loan_status::text = 'Charged Off'::text)::numeric / count(*)::numeric, 2)) DESC;;

