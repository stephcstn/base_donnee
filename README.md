# Base de Données Football Analytics (Oracle SQL / PL-SQL)

Projet universitaire de conception relationnelle, ingestion de données (ETL) et administration de base de données sous Oracle Database à partir du jeu de données européen *European Soccer Database*.

---

## Objectif & Contexte

L'objectif de ce projet est de transformer des données brutes issues d'une source dénormalisée (`dataL3`) en un schéma relationnel normalisé (3NF), intègre et performant, puis de mettre en place une politique stricte de sécurité d'accès aux données par rôles applicatifs.

### Compétences techniques démontrées :
* **Modélisation relationnelle & DDL :** Conception d'entités, intégrité référentielle (`PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `CHECK`).
* **Ingestion & Transformation (ETL SQL) :** Parsing de chaînes (`SUBSTR`, `INSTR`), conversions de types (`TO_DATE`), normalisation d'unités (livres vers kg) et déduplication (`UNION`, `DISTINCT`).
* **Automatisation :** Génération de séquences (`SEQUENCE`) et de triggers d'auto-incrémentation (`TRIGGER BEFORE INSERT`).
* **Administration & Sécurité (DCL) :** Définition de profils utilisateurs et gestion fine des privilèges via les rôles Oracle (`GRANT`, `ROLES`).
* **Génération dynamique PL/SQL :** Scripts PL/SQL de requêtage dynamique automatisé pour le peuplement de tables de correspondances.

---

## Modèle Relationnel (Schéma Conceptuel)

Le schéma repose sur 7 tables interconnectées :

```text
       [Ligue] 1 ──── ∞ [Equipe] 1 ──── ∞ [Match] ∞ ──── 1 [Marquer]
                            │                 │              │
                            │                 │              │
                            ∞                 ∞              ∞
                        [Engager] ──────── [Saison]      [Joueur]
