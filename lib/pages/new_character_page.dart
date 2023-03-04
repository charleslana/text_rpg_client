import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:text_rpg_client/controllers/new_character_controller.dart';
import 'package:text_rpg_client/models/character_model.dart';
import 'package:text_rpg_client/models/new_character_model.dart';
import 'package:text_rpg_client/widgets/custom_app_bar.dart';

import '../enums/toast_enum.dart';
import '../utils/functions.dart';
import '../widgets/input_widget.dart';

class NewCharacterPage extends GetView<NewCharacterController> {
  const NewCharacterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NewCharacterModel newCharacter = NewCharacterModel();

    void selectCharacterClass(int index, CharacterModel character) {
      controller.setCharacterId(index, character.id, character.description);
    }

    Future<void> create() async {
      newCharacter
        ..setGender(controller.gender.value)
        ..setCharacterId(controller.characterId.value ?? 0);
      final String? validate = newCharacter.validate();
      if (validate == null) {
        await controller.create(newCharacter);
        return;
      }
      showToast(validate, ToastEnum.error);
    }

    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Criar personagem'),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: controller.obx(
              (state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Escolha a classe do personagem',
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: GroupButton<CharacterModel>(
                        buttons: state as List<CharacterModel>,
                        buttonIndexedBuilder: (selected, index, context) {
                          return ChoiceChip(
                            label: Text(state[index].characterClass),
                            selected: selected,
                          );
                        },
                        controller: controller.characterClassController,
                        onSelected: (value, index, isSelected) =>
                            selectCharacterClass(index, value),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Obx(() {
                          return Text(
                              controller.characterDescription.value ?? '');
                        }),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Escolha o gênero',
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 20),
                    GroupButton<String>(
                      buttons: const ['Masculino', 'Feminino'],
                      controller: controller.genderController,
                      onSelected: (value, index, isSelected) =>
                          controller.setGender(index),
                      options: const GroupButtonOptions(
                        selectedColor: Colors.deepOrange,
                        unselectedColor: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Digite o nome do personagem',
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 20),
                    InputWidget(
                      onChanged: newCharacter.setName,
                      validator: (value) => newCharacter.name.validate(),
                      text: 'Nome',
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: create,
                        child: const Text('Criar'),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              },
              onEmpty: const Center(
                child: Text('empty'),
              ),
              onError: (error) => Center(
                child: Text(error.toString()),
              ),
              onLoading: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
