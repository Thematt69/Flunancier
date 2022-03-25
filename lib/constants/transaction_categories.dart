import 'package:flunancier/models/transaction_category.dart';
import 'package:flutter/material.dart';

/// Catégorie pour une dépense
const expenseCategories = [
  TransactionCategory(
    name: "Habitation",
    color: Colors.purple,
    type: TypeTransaction.expenses,
    subCategory: [
      TransactionCategory(
        name: "Travaux",
        color: Colors.purple,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Electricité, gaz, eau",
        color: Colors.purple,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Taxes",
        color: Colors.purple,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Loyer",
        color: Colors.purple,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Assurance",
        color: Colors.purple,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Ménage",
        color: Colors.purple,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Ameublement",
        color: Colors.purple,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
    ],
  ),
  TransactionCategory(
    name: "Loisirs",
    color: Colors.deepPurple,
    type: TypeTransaction.expenses,
    subCategory: [
      TransactionCategory(
        name: "Multimédia",
        color: Colors.deepPurple,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Vacances",
        color: Colors.deepPurple,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Animaux",
        color: Colors.deepPurple,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Sport",
        color: Colors.deepPurple,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Sorties",
        color: Colors.deepPurple,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Cadeaux",
        color: Colors.deepPurple,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Événement",
        color: Colors.deepPurple,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Jeux",
        color: Colors.deepPurple,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Hôtels/Gites",
        color: Colors.deepPurple,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Livres",
        color: Colors.deepPurple,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
    ],
  ),
  TransactionCategory(
    name: "Communications",
    color: Colors.blueGrey,
    type: TypeTransaction.expenses,
    subCategory: [
      TransactionCategory(
        name: "Téléphone",
        color: Colors.blueGrey,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Internet/TV",
        color: Colors.blueGrey,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
    ],
  ),
  TransactionCategory(
    name: "Alimentation",
    color: Colors.blue,
    type: TypeTransaction.expenses,
    subCategory: [
      TransactionCategory(
        name: "Courses",
        color: Colors.blue,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Restaurant",
        color: Colors.blue,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Cantine",
        color: Colors.blue,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
    ],
  ),
  TransactionCategory(
    name: "Transport",
    color: Colors.brown,
    type: TypeTransaction.expenses,
    subCategory: [
      TransactionCategory(
        name: "Véhicule",
        color: Colors.brown,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Moto",
        color: Colors.brown,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Péages",
        color: Colors.brown,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Essence",
        color: Colors.brown,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Location véhicule",
        color: Colors.brown,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Assurance",
        color: Colors.brown,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Parking",
        color: Colors.brown,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
    ],
  ),
  TransactionCategory(
    name: "Santé/Bien-être",
    color: Colors.cyan,
    type: TypeTransaction.expenses,
    subCategory: [
      TransactionCategory(
        name: "Soin du corps",
        color: Colors.cyan,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Services à la personne",
        color: Colors.cyan,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Mutuelle",
        color: Colors.cyan,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Pharmacie",
        color: Colors.cyan,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Assurance",
        color: Colors.cyan,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Médecin",
        color: Colors.cyan,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Hopital",
        color: Colors.cyan,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Coiffeur",
        color: Colors.cyan,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
    ],
  ),
  TransactionCategory(
    name: "Habillement",
    color: Colors.pinkAccent,
    type: TypeTransaction.expenses,
    subCategory: [
      TransactionCategory(
        name: "Vêtements",
        color: Colors.pinkAccent,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Chaussures",
        color: Colors.pinkAccent,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Accessoires",
        color: Colors.pinkAccent,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
    ],
  ),
  TransactionCategory(
    name: "Finances",
    color: Colors.red,
    type: TypeTransaction.expenses,
    subCategory: [
      TransactionCategory(
        name: "Impôts",
        color: Colors.red,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Epargne",
        color: Colors.red,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Prêts",
        color: Colors.red,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Frais bancaires",
        color: Colors.red,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Assurance vie",
        color: Colors.red,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Bourse",
        color: Colors.red,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Retrait d'argent",
        color: Colors.red,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
    ],
  ),
  TransactionCategory(
    name: "Autres",
    color: Colors.yellow,
    type: TypeTransaction.expenses,
    subCategory: [
      TransactionCategory(
        name: "Frais professionel",
        color: Colors.yellow,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Enfants",
        color: Colors.yellow,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Amendes",
        color: Colors.yellow,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Frais de justice",
        color: Colors.yellow,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "FRais de scolarité",
        color: Colors.yellow,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Gardes d'enfant",
        color: Colors.yellow,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Dons",
        color: Colors.yellow,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
      TransactionCategory(
        name: "Autres dépenses",
        color: Colors.yellow,
        type: TypeTransaction.expenses,
        subCategory: [],
      ),
    ],
  ),
];

/// Catégorie pour un revenu
const incomeCategories = [
  TransactionCategory(
    name: "Salaires",
    color: Colors.green,
    type: TypeTransaction.income,
    subCategory: [],
  ),
  TransactionCategory(
    name: "Assurance Maladie",
    color: Colors.green,
    type: TypeTransaction.income,
    subCategory: [],
  ),
  TransactionCategory(
    name: "Remboursement frais pro",
    color: Colors.green,
    type: TypeTransaction.income,
    subCategory: [],
  ),
  TransactionCategory(
    name: "Revenu foncier",
    color: Colors.green,
    type: TypeTransaction.income,
    subCategory: [],
  ),
  TransactionCategory(
    name: "Allocations familliales",
    color: Colors.green,
    type: TypeTransaction.income,
    subCategory: [],
  ),
  TransactionCategory(
    name: "Rentes et pensions",
    color: Colors.green,
    type: TypeTransaction.income,
    subCategory: [],
  ),
  TransactionCategory(
    name: "Dividendes et plus-values",
    color: Colors.green,
    type: TypeTransaction.income,
    subCategory: [],
  ),
  TransactionCategory(
    name: "Cadeaux",
    color: Colors.green,
    type: TypeTransaction.income,
    subCategory: [],
  ),
  TransactionCategory(
    name: "Autres revenus",
    color: Colors.green,
    type: TypeTransaction.income,
    subCategory: [],
  ),
];
