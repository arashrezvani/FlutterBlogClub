import 'package:blogclub/data.dart';
import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeDate = Theme.of(context);
    final posts = AppDatabase.posts;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              backgroundColor: themeDate.colorScheme.onPrimary
                  .withOpacity(0), // برای اینک شادو کارت پایین روش بیفته
              elevation: 0,
              title: const Text('Profile'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.more_horiz_rounded),
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(32, 0, 32, 64),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: themeDate.colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        color:
                            themeDate.colorScheme.onSecondary.withOpacity(0.1),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                        child: Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Assets.img.stories.story8
                                    .image(width: 84, height: 84)),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('@joviedan'),
                                  Text(
                                    'Jovi Daniel',
                                    style: themeDate.textTheme.bodyLarge!
                                        .copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'UX Designer',
                                    style: themeDate.textTheme.bodyLarge!.apply(
                                        color: themeDate.colorScheme.primary),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                        child: Text(
                          'About me',
                          style: themeDate.textTheme.headlineLarge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 4, 32, 32),
                        child: Text(
                          'Madison Blackstone is a director of user experience design, with experience managing global teams.',
                          style: themeDate.textTheme.bodyMedium,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                ),
                Positioned(
                    //برای اینکه زیر کادر ابی پست و ... شادو داشته باشه که یکم از کناره ها اون کوچکتر باشه
                    bottom: 30,
                    left: 96,
                    right: 96,
                    child: Container(
                      height: 32,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          blurRadius: 30,
                          color: themeDate.colorScheme.onSecondary
                              .withOpacity(0.8),
                        ),
                      ]),
                    )),
                Positioned(
                  bottom: 32,
                  left: 64,
                  right: 64,
                  child: Container(
                    height: 68,
                    decoration: BoxDecoration(
                      color: themeDate.colorScheme.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex:
                              1, //اگر این رو ردیف سه فرزند داشته باشه به سه قسمت مساوی فضا رو به اون ستا میده
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff2151CD),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '52',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: themeDate.colorScheme.onPrimary),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Post',
                                  style: themeDate.textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.w300,
                                      color: themeDate.colorScheme
                                          .onPrimary), //تفاوت اپلای با کپی ویت اپلای روی این تکس استایل این تغییر رو ایجاد میکنه و اپلای میکنه رو اون تم ولی کپی میکنیم این کپی میکنه و تمامی خصوصایت رو میتونیم تغییر بدیم مثلا رو اپلای فونت ویت نمی تونیم استفاده کنیم ولی در کپی ویت میتونیم
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex:
                              1, //اگر این رو ردیف سه فرزند داشته باشه به سه قسمت مساوی فضا رو به اون ستا میده
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '250',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: themeDate.colorScheme.onPrimary),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Following',
                                style: themeDate.textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w300,
                                    color: themeDate.colorScheme
                                        .onPrimary), //تفاوت اپلای با کپی ویت اپلای روی این تکس استایل این تغییر رو ایجاد میکنه و اپلای میکنه رو اون تم ولی کپی میکنیم این کپی میکنه و تمامی خصوصایت رو میتونیم تغییر بدیم مثلا رو اپلای فونت ویت نمی تونیم استفاده کنیم ولی در کپی ویت میتونیم
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex:
                              1, //اگر این رو ردیف سه فرزند داشته باشه به سه قسمت مساوی فضا رو به اون ستا میده
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '4.5K',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: themeDate.colorScheme.onPrimary),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Followers',
                                style: themeDate.textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w300,
                                    color: themeDate.colorScheme
                                        .onPrimary), //تفاوت اپلای با کپی ویت اپلای روی این تکس استایل این تغییر رو ایجاد میکنه و اپلای میکنه رو اون تم ولی کپی میکنیم این کپی میکنه و تمامی خصوصایت رو میتونیم تغییر بدیم مثلا رو اپلای فونت ویت نمی تونیم استفاده کنیم ولی در کپی ویت میتونیم
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: themeDate.colorScheme.surface,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'My Posts',
                            style: themeDate.textTheme.headlineLarge,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Assets.img.icons.grid.svg(),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Assets.img.icons.table.svg(),
                        ),
                      ],
                    ),
                  ),
                  for (var i = 0; i < posts.length; i++) Post(post: posts[i])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
