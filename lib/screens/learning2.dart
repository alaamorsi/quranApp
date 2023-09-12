import 'package:flutter/material.dart';
import 'package:quran_app/our_widgets.dart';

// ignore: must_be_immutable
class Learning2Screen extends StatefulWidget {

  String title;
  late String titleQ;

  Learning2Screen({required this.title,super.key}) {
    titleQ = title;
  }

  @override
  State<Learning2Screen> createState() =>Learning2ScreenState();
}

class Learning2ScreenState extends State<Learning2Screen> {

  List<String> washingImages = [
    'assets/wash_and_pray/1.jpg',
    'assets/wash_and_pray/2.jpg',
    'assets/wash_and_pray/3.jpg',
    'assets/wash_and_pray/4.jpg',
    'assets/wash_and_pray/5.jpg',
    'assets/wash_and_pray/6.jpg',
    'assets/wash_and_pray/7.jpg',
    'assets/wash_and_pray/8.jpg',
    'assets/wash_and_pray/9.jpg',
    ];
  List<String> prayingImages = [
    'assets/wash_and_pray/10.jpg',
    'assets/wash_and_pray/20.jpg',
    'assets/wash_and_pray/30.jpg',
    'assets/wash_and_pray/40.jpg',
    'assets/wash_and_pray/50.jpg',
    'assets/wash_and_pray/60.jpg',
    'assets/wash_and_pray/70.jpg',
    'assets/wash_and_pray/80.jpg',
    'assets/wash_and_pray/90.jpg',
    'assets/wash_and_pray/100.jpg',
    'assets/wash_and_pray/110.jpg',
  ];

  List<String> washingNotes =[
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  List<String> prayingNotes =[
    'النية محلها القلب, لا يشترط القول باللسان',
    'التكبير بفتح الاصابع ورفع اليدين إلى الأذن او إلى ارتفاع الكتف(تكبيرة الإحرام)',
    'تضع يديك (اليسرى ثم اليمنى) مابين السرة والصدر وتقرأ دعاء الإستفتاح(سنه لا يوثر عدم قوله على صحة الصلاة) ثم سورة الفاتحة وما تيسر من القرأن',
    'ترفع يديك ايضاً وتكبر مثل تكبيرة الإحرام',
    'تنحني لتمسك بكفيك مكان الركبتين ايضاً مع فتح الأصابع ومرعاة استقامة الظهر وتقول "سبحان ربي العظيم" ثلاث مرات',
    'ترفع من الركوع مثل تكبيرة الإحرام ولكن تقول "سمع الله لمن حمده" ثم حين تعتدل فى وقفتك تقول "ربنا ولك الحمد حمداً كثيراً طيباً مباركاً فيه"',
    'تقول الله اكبر وتنزل على ركبتيك (شرط الاستطاعة) لتسجد مع مباعدة الجسد عن بعضه ومباعدة الكوع عن الأرض والجسد وتوجيه اليدين الى القبلة مع ضم الاصابع وتقول"سبحان ربي الأعلى" ثلاث مرات ويٌستحب ايضا الدعاء',
    'ثم ترفع من السجود لتجلس فتقول "اللهم اغفرلي وارحمني واهدني وارزقني واجبرني" او إذا لم تحفظه فقط اجلس ثانية',
    'ثم تسجد مرة اخرى مثل الاولى',
    'ثم حين تنتهي من السجود تقوم فتفع كما فعلت فى اول ركعة ثم تجلس فى السجدة الثانة من الركعة الثانية لقرأة التشهد (كاملاً اذا كانت الصلاة ركعتين فقط كالفجر او السنن او نصف التشهد فى باقى الصلوات) نصف التشهد هو "التحيات لله، والصلوات والطيبات، السلام عليك أيها النبي، ورحمة الله وبركاته، السلام علينا وعلى عباد الله الصالحين، أشهد أن لا إله إلا الله وحده لا شريك له، وأشهد أن محمدًا عبده ورسوله" وكاملا فانك تكمل على النص السابق بـ" اللهم صل على محمد وعلى آل محمد، كما صليت على إبراهيم، وعلى آل إبراهيم، إنك حميد مجيد، اللهم بارك على محمد، وعلى آل محمد، كما باركت على إبراهيم، وعلى آل إبراهيم،إنك حميد مجيد". ',
    'إذا كانت الصلاة اربع ركعات او ثلاث فأنك تأتي بالركعة الاخيرة فتقرأ التشهد كاملاً فى اخر جِلسه فتنيه لتسلم فتتجه بوحهك الى اليمين وتقول "السلام عليكم ورحمة الله" ثم الى اليسار فتقول مثلها وايضا يجوز الدعاء قبل التسليم'
  ];
  List<String> learn = [];
  List<String> notes = [];
  int plus = 0;

  @override
  Widget build(BuildContext context) {
    if(widget.title =='تعلم الوضوء')
      {
        learn = washingImages;
        notes = washingNotes;
      } else {
        learn = prayingImages;
        notes = prayingNotes;
      }
    return Scaffold(
      appBar: myAppBar(context: context, title: widget.title),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blueGrey.shade300,
                Colors.blueGrey.shade600
              ]
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 35.0,horizontal: 25.0),
          child: ListView(
              children: [
                //image
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                        image: AssetImage(learn[plus]),
                        fit: BoxFit.fill),
                  ),
                ),
                SizedBox(height: 25.0,),
                //notes توضيح
                Container(
                  // height: 200.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.blueGrey.shade500,
                          Colors.blueGrey.shade900,
                        ]
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(': توضيح ',style: TextStyle(color: Colors.white,fontSize: 20.0),),
                        SizedBox(height: 3.0,),
                        Text('${notes[plus]}',style: TextStyle(color: Colors.white,fontSize: 17.0),textAlign: TextAlign.end,),
                      ]
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                //buttons
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){
                      if(plus > 0){
                        setState(() {
                          plus -=1;
                        });
                      }
                      else
                      {
                        setState(() {
                          plus = learn.length-1;
                        });
                      }
                    }, icon: Icon(Icons.arrow_circle_left,size: 65,color: Colors.white70,)),
                    SizedBox(width: 40.0,),
                    IconButton(onPressed: (){
                      if(plus < learn.length-1){
                        setState(() {
                          plus +=1;
                        });
                      }
                      else
                      {
                        setState(() {
                          plus = 0;
                        });
                      }
                    }, icon: Icon(Icons.arrow_circle_right,size: 65,color: Colors.white70,)),
                    SizedBox(width: 30.0,),
                  ]
                ),
              ]
          ),
        ),
      ),
    );
  }
}

