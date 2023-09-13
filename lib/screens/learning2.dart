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
    'assets/wash_and_pray/a1.jpg',
    'assets/wash_and_pray/a3.jpg',
    'assets/wash_and_pray/a4.jpg',
    'assets/wash_and_pray/a5.jpg',
    'assets/wash_and_pray/a6.jpg',
    'assets/wash_and_pray/a7.jpg',
    'assets/wash_and_pray/a8.jpg',
    'assets/wash_and_pray/a9.jpg',
    'assets/wash_and_pray/a10.jpg',
    'assets/wash_and_pray/a11.jpg',
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
    'تنوي بقلبك الوضوء لأن النية محلها القلب ثم تقول البسملة "بسم الله الرحمن الرحيم" ثم تشرع فى الوضوء',
    'تغسل يديك جيداً مع تخليل الأصابع (اي يدخل الماء بينها جيداً) ثلاث مرات',
    'تمضمض ثلاث مرات، والمضمضة هي إدارة الماء في الفم وتحريكه بهدف إزالة بقايا الطعام العالقة في الفم وبين الأسنان ، وإذا أخذت غرفة واحدة بيدك يمكن أنْ تتمضمض بها ثلاث مرات، ومن السنة المبالغة فيه إلا أن كنت صائما حتى لا يصل إلى جوفك شيئا من الماء',
    'استنشق ثلاث مرات وانثر الماء من أنفك بيدك اليسرى ، والاستنشاق هو إيصال الماء إلى داخل الأنف ، والاستنثار هو إخراجه من الأنف، والهدف منه تنظيف الأنف. و أيضاً من السنة المبالغة فيه إلا أن تكون صائما لئلا يصل إلى جوفك شيئا من الماء',
    'املأ كفيك بالماء واغسل بهما وجهك كله جيدا من منابت شعر الرأس إلى ما انحدر من اللحيين والذقن ، طولاً ، ومن حدّ الأذن اليمنى إلى حد الأذن اليسرى عرضا ثلاث مرات',
    'اغسل يديك مع المرفقين (الكوع)، ليس إلى المرفقين بل مع غسل المرفقين ، ويجب أن يصل الماء إليه ويتجاوزه قليلا،وحَدُّ اليد من رؤوس الأصابع مع الأظافر إلى أول العضد اليد اليمنى ثلاث مرات ثم اليسرى ثلاثأ',
    'الرأس يمسح ولا يغسل، وصفة مسح الرأس أن تضع يديك مبلولتين بالماء على مقدم رأسك وتمررهما إلى قفاك ثم تردهما إلى الموضع الذي بدأت منه مرة واحدة',
    'امسح الأذنين ولو بماء الرأس، فهذا ممكن، أن تمسح الأذنين بماء الرأس نفسه، أدخل أصبعيك السبابتين في فتحتي أذنيك، وامسح ظاهرهما بإبهاميك ومررها بتجاويفها، ثم ظاهر الأذن والرقبة',
    'اغسل رجليك ثلاث مرات بالماء جيدا إلى الكعبين واستوعب المكان كله بالغسل، والكعبان هما العظمان الناتئان في أسفل الساقً',
    'ثم عند الإنتهاء تقول " أشهد أن لا إله إلا الله وحده لا شريك له وأشهد أن محمداً عبده ورسوله" وتنصرف لأداء الصلاة'
  ];
  List<String> prayingNotes =[
    'النية محلها القلب, لا يشترط القول باللسان',
    'التكبير بفتح الأصابع ورفع اليدين إلى الأذن او إلى ارتفاع الكتف (تكبيرة الإحرام)',
    'تضع يديك (اليسرى ثم اليمنى) مابين السٌرة والصدر وتقرأ دعاء الإستفتاح (سنة لا يؤثر عدم قوله على صحة الصلاة) ثم سورة الفاتحة وما تيسر من القرأن',
    'ترفع يديك ايضاً وتكبر مثل تكبيرة الإحرام',
    'تنحني لتمسك بكفيك مكان الركبتين ايضاً مع فتح الأصابع ومرعاة استقامة الظهر وتقول "سبحان ربي العظيم" ثلاث مرات',
    'ترفع من الركوع مثل تكبيرة الإحرام ولكن تقول "سمع الله لمن حمده" ثم حين تعتدل فى وقفتك تقول "ربنا ولك الحمد حمداً كثيراً طيباً مباركاً فيه".',
    'تقول الله اكبر وتنزل على ركبتيك (شرط الاستطاعة) لتسجد مع مباعدة الجسد عن بعضه ومباعدة الكوع عن الأرض والجسد وتوجيه اليدين الى القبلة مع ضم الأصابع وتقول "سبحان ربي الأعلى" ثلاث مرات ويَجوز ايضا الدعاء بما تريد',
    'ثم ترفع من السجود لتجلس فتقول "اللهم اغفرلي وارحمني واهدني وارزقني واجبرني" او إذا لم تحفظه فقط اجلس مقدار ثانية او اثنتين',
    'ثم تسجد مرة اخرى مثل الاولى',
    'ثم حين تنتهي من السجود تقوم فتفعل كما فعلت فى اول ركعة ثم تجلس فى السجدة الثانة من الركعة الثانية لقراءة التشهد ( كاملاً اذا كانت الصلاة ركعتين فقط كالفجر او السُنن او نصف التشهد فى باقى الصلوات) نصف التشهد هو "التحيات لله، والصلوات والطيبات، السلام عليك أيها النبي، ورحمة الله وبركاته، السلام علينا وعلى عباد الله الصالحين، أشهد أن لا إله إلا الله وحده لا شريك له، وأشهد أن محمدًا عبده ورسوله" وكاملا فإنك تكمل على النص السابق بـ" اللهم صل على محمد وعلى آل محمد، كما صليت على إبراهيم، وعلى آل إبراهيم، إنك حميد مجيد، اللهم بارك على محمد، وعلى آل محمد، كما باركت على إبراهيم، وعلى آل إبراهيم،إنك حميد مجيد".',
    'إذا كانت الصلاة اربع ركعات او ثلاث فإنك تأتي فى الركعة الاخيرة فتقرأ التشهد كاملاً فى اخر جلسة فتنيه لتسلم فتتجه بوجهك الى اليمين وتقول "السلام عليكم ورحمة الله" ثم الى اليسار فتقول مثلها وايضا يجوز الدعاء قبل التسليم'
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
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(': توضيح',style: TextStyle(color: Colors.white,fontSize: 20.0),),
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
                    InkWell(
                        onTap: (){
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
                        },
                        child: Icon(Icons.arrow_circle_left,size: 70,color: Colors.white70,)),
                    SizedBox(width: 50.0,),
                    InkWell(
                        onTap: (){
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
                        },
                        child: Icon(Icons.arrow_circle_right,size: 70,color: Colors.white70,)),
                  ]
                ),
                SizedBox(height: 30.0,),
              ]
          ),
        ),
      ),
    );
  }
}

