import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvc/controllers/search_controller.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  SearchController searchControllerData = Get.put(SearchController());

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade500,
      appBar: AppBar(
        title: const Text("List Item"),
        centerTitle: true,
      ),
      body: Obx(
        () => searchControllerData.isloading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                primary: false,
                shrinkWrap: true,
                itemCount: searchControllerData.data?.search?.results?.length,
                itemBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 229, 149, 240),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              searchControllerData
                                      .data?.search?.results?[index].text
                                      .toString() ??
                                  "",
                              textDirection: TextDirection.rtl,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Translations :",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              removeAllHtmlTags(
                                searchControllerData.data?.search
                                        ?.results?[index].translations?[0].text
                                        .toString() ??
                                    "",
                              ),
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
      ),
    );
  }
}
