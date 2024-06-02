// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:daycare_app/models/form_data.dart';

class ChildActivityScreen extends StatelessWidget {
  final FormData? childData;
  final FormData? activityData;

  const ChildActivityScreen({super.key, this.childData, this.activityData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kegiatan Anak'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            if (childData != null) ...[
              Text('Name: ${childData!.name}'),
              SizedBox(height: 8.0),
              Text('Date: ${childData!.date}'),
              SizedBox(height: 8.0),
              Text('Arrival: ${childData!.arrival}'),
              SizedBox(height: 8.0),
              Text('Body Temperature: ${childData!.bodyTemperature}'),
              SizedBox(height: 8.0),
              Text('Conditions: ${childData!.conditions}'),
              SizedBox(height: 16.0),
            ],
            if (activityData != null) ...[
              // Meals
              Text('Meals', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8.0),
              ...activityData!.meals.map((meal) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Type: ${meal.type.toString().split('.').last}'),
                    Text('Food: ${meal.food}'),
                    Text('Quantity: ${meal.quantity.toString().split('.').last}'),
                    Text('Comments: ${meal.comments}'),
                    SizedBox(height: 8.0),
                  ],
                ),
              )),
              SizedBox(height: 16.0),
              // Toilets
              Text('Toilets', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8.0),
              ...activityData!.toilets.map((toilet) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Time: ${toilet.time}'),
                    Text('Type: ${toilet.type.toString().split('.').last}'),
                    Text('Condition: ${toilet.condition.toString().split('.').last}'),
                    Text('Notes: ${toilet.notes}'),
                    SizedBox(height: 8.0),
                  ],
                ),
              )),
              SizedBox(height: 16.0),
              // Rests
              Text('Rests', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8.0),
              ...activityData!.rests.map((rest) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Start Rest: ${rest.start}'),
                    Text('End Rest: ${rest.end}'),
                    SizedBox(height: 8.0),
                  ],
                ),
              )),
              SizedBox(height: 16.0),
              // Bottles
              Text('Bottles', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8.0),
              ...activityData!.bottles.map((bottle) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Time: ${bottle.time}'),
                    Text('ML: ${bottle.ml}'),
                    Text('Type: ${bottle.type.toString().split('.').last}'),
                    SizedBox(height: 8.0),
                  ],
                ),
              )),
              SizedBox(height: 16.0),
              // Other
              Text('Shower: ${activityData!.shower}'),
              SizedBox(height: 8.0),
              Text('Vitamin: ${activityData!.vitamin}'),
              SizedBox(height: 8.0),
              Text('Notes For Parents: ${activityData!.notesForParents}'),
              SizedBox(height: 8.0),
              Text('Items Needed: ${activityData!.itemsNeeded.join(', ')}'),
              SizedBox(height: 16.0),
            ],
          ],
        ),
      ),
    );
  }
}
