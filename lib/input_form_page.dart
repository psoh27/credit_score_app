import 'package:flutter/material.dart';

class InputFormPage extends StatefulWidget{
  @override
  _InputFormPageState createState() => _InputFormPageState();
}

class _InputFormPageState extends State<InputFormPage>{

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController incomeController = TextEditingController();

  String selectedJob = '사무직';
  String selectedMaritalStatus = '미혼';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('대출 신청 - 정보 입력')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: '이름'),
            ),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: '나이'),
            ),
            TextField(
              controller: incomeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: '연간 소득'),
            ),
            DropdownButton<String>(
              value: selectedJob,
              onChanged: (String? newValue) {
                setState(() {
                  selectedJob = newValue!;
                });
              },
              items: ['사무직', '영업직', '서비스직', '프리랜서']
                  .map<DropdownMenuItem<String>>((String job) {
                return DropdownMenuItem<String>(
                  value: job,
                  child: Text(job),
                );
              }).toList(),
            ),
            DropdownButton<String>(
              value: selectedMaritalStatus,
              onChanged: (String? newValue) {
                setState(() {
                  selectedMaritalStatus = newValue!;
                });
              },
              items: ['미혼', '기혼']
                  .map<DropdownMenuItem<String>>((String status) {
                return DropdownMenuItem<String>(
                  value: status,
                  child: Text(status),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('이름: ${nameController.text}');
                print('나이: ${ageController.text}');
                print('연간 소득: ${incomeController.text}');
                print('직업: $selectedJob');
                print('결혼 여부: $selectedMaritalStatus');
              },
              child: Text('예측하기'),
            )
          ],
        ),
      ),
    );
  }
}

