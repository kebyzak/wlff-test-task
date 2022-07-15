import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/feature/auth/bloc/auth_bloc.dart';
import 'package:rental_app/feature/auth/ui/sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rental_app/feature/homepage/ui/carpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Homepage',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Unauth) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => SignIn()),
              (route) => false,
            );
          }
        },
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                StreamBuilder(
                  stream:
                      FirebaseFirestore.instance.collection('cars').snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snap) {
                    if (snap.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snap.data!.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot docSnap =
                              snap.data!.docs[index];
                          return Card(
                            child: ListTile(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => CarPage(docSnap),
                                  ),
                                );
                              },
                              leading: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minWidth: 200,
                                  maxWidth: 340,
                                  minHeight: 200,
                                  maxHeight: 340,
                                ),
                                child: Image.network(
                                  docSnap['image'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(docSnap['brand']),
                            ),
                          );
                        },
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black87),
                  onPressed: () {
                    context.read<AuthBloc>().add(SignOutRequest());
                  },
                  child: const Text(
                    'Шығу',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
