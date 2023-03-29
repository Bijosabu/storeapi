import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:storeapp/Models/userModel/user_model/user_model.dart';
import 'package:provider/provider.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final UserModel userModelprovider = Provider.of<UserModel>(context);
    Size size = MediaQuery.of(context).size;
    return ListTile(
      leading: FancyShimmerImage(
        errorWidget: const Icon(Icons.error),
        height: size.height * 0.15,
        width: size.width * 0.15,
        imageUrl: userModelprovider.avatar!,
        boxFit: BoxFit.fill,
      ),
      title: Text(userModelprovider.name!),
      subtitle: Text(userModelprovider.email!),
      trailing: Text(
        userModelprovider.role!,
        style: const TextStyle(
            color: Colors.deepPurple,
            fontSize: 15,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
