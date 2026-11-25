# Credit Risk Portfolio Analysis

## Project Overview

This project analyzes historical Lending Club loan data to evaluate credit portfolio performance and identify patterns associated with credit losses.

The analysis focuses on **36-month loans issued between 2011 and 2015**, investigating loan outcomes, borrower financial characteristics, interest rates, and credit risk classifications.

## Business Problem

A financial institution's Credit Risk Management team needs to evaluate historical loan performance to identify segments associated with higher credit losses and support future credit policy assessments.

The project aims to answer the following questions:

1. How did loan origination volume evolve between 2011 and 2015?
2. How did the proportion of fully paid and charged-off loans vary across origination years?
3. Which credit risk grades showed higher proportions of charged-off loans?
4. How is the debt-to-income ratio (DTI) associated with loan outcomes?
5. How do interest rates relate to loan performance?
6. Which loan purposes showed higher proportions of credit losses?

## Dataset

- **Source:** [Lending Club Loan Data — Kaggle](https://www.kaggle.com/datasets/wordsforthewise/lending-club)
- **Original dataset:** 2,267,701 records and 151 columns
- **Selected dataset:** 603,736 loan records and 11 columns
- **Origination period:** 2011–2015
- **Loan term:** 36 months

The original dataset is not included in this repository due to its size.

## Technologies

- **Python and Pandas:** Data exploration, quality assessment, and preparation
- **PostgreSQL:** SQL queries and credit risk analysis
- **Power BI:** Interactive dashboard and KPI visualization
- **PowerPoint:** Executive presentation of findings

## Data Quality

The selected dataset contains no duplicate loan identifiers or fully duplicated records.

Two records contain missing DTI values and report zero annual income. These records were retained, preserving the missing values for analyses where DTI is unavailable.

## Project Status

**In progress — Data preparation completed. SQL analysis is the next stage.**
