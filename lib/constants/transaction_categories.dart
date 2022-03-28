import 'package:flunancier/models/transaction_category.dart';
import 'package:flutter/material.dart';

/// Catégorie pour une dépense
const expenseCategories = [
  TransactionCategory(
    name: 'Habitation',
    color: Colors.purple,
    subCategory: [
      // TransactionSubCategory(
      //   name: 'Travaux',
      //   color: Colors.purple,
      //   icon: Icons.handyman_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Electricité, gaz, eau',
      //   color: Colors.purple,
      //   icon: Icons.bolt_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Taxes',
      //   color: Colors.purple,
      //   icon: Icons.account_balance_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Loyer',
      //   color: Colors.purple,
      //   icon: Icons.home_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Assurance',
      //   color: Colors.purple,
      //   icon: Icons.paid_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Ménage',
      //   color: Colors.purple,
      //   icon: Icons.cleaning_services_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Ameublement',
      //   color: Colors.purple,
      //   icon: Icons.chair_alt_outlined,
      // ),
    ],
    icon: Icons.home_work_outlined,
  ),
  TransactionCategory(
    name: 'Loisirs',
    color: Colors.deepPurple,
    icon: Icons.games_outlined,
    subCategory: [
      // TransactionSubCategory(
      //   name: 'Multimédia',
      //   color: Colors.deepPurple,
      //   icon: Icons.mouse_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Vacances',
      //   color: Colors.deepPurple,
      //   icon: Icons.holiday_village_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Animaux',
      //   color: Colors.deepPurple,
      //   icon: Icons.pets_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Sport',
      //   color: Colors.deepPurple,
      //   icon: Icons.fitness_center_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Sorties',
      //   color: Colors.deepPurple,
      //   icon: Icons.local_bar_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Cadeaux',
      //   color: Colors.deepPurple,
      //   icon: Icons.card_giftcard_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Événement',
      //   color: Colors.deepPurple,
      //   icon: Icons.confirmation_number_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Jeux',
      //   color: Colors.deepPurple,
      //   icon: Icons.sports_esports_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Hôtels/Gites',
      //   color: Colors.deepPurple,
      //   icon: Icons.hotel_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Livres',
      //   color: Colors.deepPurple,
      //   icon: Icons.book_outlined,
      // ),
    ],
  ),
  TransactionCategory(
    name: 'Communications',
    color: Colors.blueGrey,
    icon: Icons.phone_outlined,
    subCategory: [
      // TransactionSubCategory(
      //   name: 'Téléphone',
      //   color: Colors.blueGrey,
      //   icon: Icons.phone_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Internet/TV',
      //   color: Colors.blueGrey,
      //   icon: Icons.router_outlined,
      // ),
    ],
  ),
  TransactionCategory(
    name: 'Alimentation',
    color: Colors.blue,
    icon: Icons.restaurant_outlined,
    subCategory: [
      // TransactionSubCategory(
      //   name: 'Courses',
      //   color: Colors.blue,
      //   icon: Icons.shopping_cart_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Restaurant',
      //   color: Colors.blue,
      //   icon: Icons.restaurant_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Cantine',
      //   color: Colors.blue,
      //   icon: Icons.brunch_dining_outlined,
      // ),
    ],
  ),
  TransactionCategory(
    name: 'Transport',
    color: Colors.brown,
    icon: Icons.commute_outlined,
    subCategory: [
      // TransactionSubCategory(
      //   name: 'Véhicule',
      //   color: Colors.brown,
      //   icon: Icons.directions_car_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Moto',
      //   color: Colors.brown,
      //   icon: Icons.two_wheeler_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Péages',
      //   color: Colors.brown,
      //   icon: Icons.directions_car_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Essence',
      //   color: Colors.brown,
      //   icon: Icons.local_gas_station_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Location véhicule',
      //   color: Colors.brown,
      //   icon: Icons.car_rental_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Assurance',
      //   color: Colors.brown,
      //   icon: Icons.paid_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Parking',
      //   color: Colors.brown,
      //   icon: Icons.local_parking_outlined,
      // ),
    ],
  ),
  TransactionCategory(
    name: 'Santé/Bien-être',
    color: Colors.cyan,
    icon: Icons.healing_outlined,
    subCategory: [
      // TransactionSubCategory(
      //   name: 'Soin du corps',
      //   color: Colors.cyan,
      //   icon: Icons.spa_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Services à la personne',
      //   color: Colors.cyan,
      //   icon: Icons.medical_services_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Mutuelle',
      //   color: Colors.cyan,
      //   icon: Icons.medical_services_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Pharmacie',
      //   color: Colors.cyan,
      //   icon: Icons.local_pharmacy_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Assurance',
      //   color: Colors.cyan,
      //   icon: Icons.medical_services_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Médecin',
      //   color: Colors.cyan,
      //   icon: Icons.medical_services_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Hopital',
      //   color: Colors.cyan,
      //   icon: Icons.local_hospital_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Coiffeur',
      //   color: Colors.cyan,
      //   icon: Icons.content_cut_outlined,
      // ),
    ],
  ),
  TransactionCategory(
    name: 'Habillement',
    color: Colors.pinkAccent,
    icon: Icons.checkroom_outlined,
    subCategory: [
      // TransactionSubCategory(
      //   name: 'Vêtements',
      //   color: Colors.pinkAccent,
      //   icon: Icons.checkroom_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Chaussures',
      //   color: Colors.pinkAccent,
      //   icon: Icons.checkroom_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Accessoires',
      //   color: Colors.pinkAccent,
      //   icon: Icons.checkroom_outlined,
      // ),
    ],
  ),
  TransactionCategory(
    name: 'Finances',
    color: Colors.red,
    icon: Icons.attach_money,
    subCategory: [
      // TransactionSubCategory(
      //   name: 'Impôts',
      //   color: Colors.red,
      //   icon: Icons.account_balance_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Epargne',
      //   color: Colors.red,
      //   icon: Icons.savings_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Prêts',
      //   color: Colors.red,
      //   icon: Icons.payments_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Frais bancaires',
      //   color: Colors.red,
      //   icon: Icons.payment_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Assurance vie',
      //   color: Colors.red,
      //   icon: Icons.loyalty_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Bourse',
      //   color: Colors.red,
      //   icon: Icons.currency_exchange_outlined,
      // ),
      // TransactionSubCategory(
      //   name: "Retrait d'argent",
      //   color: Colors.red,
      //   icon: Icons.local_atm_outlined,
      // ),
    ],
  ),
  TransactionCategory(
    name: 'Autres dépenses',
    color: Colors.yellow,
    icon: Icons.local_atm_outlined,
    subCategory: [
      // TransactionSubCategory(
      //   name: 'Frais professionel',
      //   color: Colors.yellow,
      //   icon: Icons.card_travel_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Enfants',
      //   color: Colors.yellow,
      //   icon: Icons.stroller_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Amendes',
      //   color: Colors.yellow,
      //   icon: Icons.local_police_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Frais de justice',
      //   color: Colors.yellow,
      //   icon: Icons.gavel_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Frais de scolarité',
      //   color: Colors.yellow,
      //   icon: Icons.school_outlined,
      // ),
      // TransactionSubCategory(
      //   name: "Gardes d'enfant",
      //   color: Colors.yellow,
      //   icon: Icons.baby_changing_station_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Dons',
      //   color: Colors.yellow,
      //   icon: Icons.volunteer_activism_outlined,
      // ),
      // TransactionSubCategory(
      //   name: 'Autres dépenses',
      //   color: Colors.yellow,
      //   icon: Icons.local_atm_outlined,
      // ),
    ],
  ),
];

/// Catégorie pour un revenu
const incomeCategories = [
  TransactionCategory(
    name: 'Salaires',
    color: Colors.green,
    icon: Icons.account_balance_wallet_outlined,
    subCategory: [],
  ),
  TransactionCategory(
    name: 'Assurance Maladie',
    color: Colors.green,
    icon: Icons.health_and_safety_outlined,
    subCategory: [],
  ),
  TransactionCategory(
    name: 'Remboursement frais pro',
    color: Colors.green,
    icon: Icons.card_travel_outlined,
    subCategory: [],
  ),
  TransactionCategory(
    name: 'Revenu foncier',
    color: Colors.green,
    icon: Icons.real_estate_agent_outlined,
    subCategory: [],
  ),
  TransactionCategory(
    name: 'Allocations familliales',
    color: Colors.green,
    icon: Icons.family_restroom_outlined,
    subCategory: [],
  ),
  TransactionCategory(
    name: 'Rentes et pensions',
    color: Colors.green,
    icon: Icons.payments_outlined,
    subCategory: [],
  ),
  TransactionCategory(
    name: 'Dividendes et plus-values',
    color: Colors.green,
    icon: Icons.savings_outlined,
    subCategory: [],
  ),
  TransactionCategory(
    name: 'Cadeaux',
    color: Colors.green,
    icon: Icons.card_giftcard_outlined,
    subCategory: [],
  ),
  TransactionCategory(
    name: 'Autres revenus',
    color: Colors.green,
    icon: Icons.local_atm_outlined,
    subCategory: [],
  ),
];
