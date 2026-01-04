# LinkedIn Post - Professional Versions

## 🇪🇬 Arabic Version (Egyptian Accent)

### Option 1: Problem-Solution Format (Recommended)

```
🎨 تحديات التطبيقات متعددة الشركات (Multi-tenant) والتيمنج الديناميكي

في تطبيقنا اللي بنخدم فيه أكتر من شركة، واجهنا مشكلة محتاجة حل:
كل شركة عندها Theme خاص بيها، وكلها عايزة الأيقونات تتغير الألوان ديناميكياً حسب الـ Brand identity بتاعها.

المشكلة:
• الأيقونات عندها أجزاء ثابتة (زي الإطار الرمادي) - لازم تفضل زي ما هي
• أجزاء تانية ديناميكية (زي القلب الأحمر) - لازم تتغير مع Theme كل شركة
• المستحيل نعمل copy/paste لكل شركة وكل theme! 😅

الحل:
عملت أداة بسيطة اسمها SVG Splitter 🚀
• بتقسم الـ SVG تلقائياً لأجزاء ثابتة وأجزاء ديناميكية
• الأجزاء الديناميكية بتتغير تلقائياً مع Theme الشركة في Flutter
• الأجزاء الثابتة بتفضل زي ما هي بدون أي تغيير

النتيجة:
✅ أيقونات ديناميكية 100% بدون تكرار
✅ كود نظيف ومرن وسهل الصيانة
✅ دعم غير محدود للـ Themes
✅ Zero dependencies - Pure Dart

🔗 Package متاح على pub.dev:
https://pub.dev/packages/svg_splitter

💻 Open source على GitHub مع أمثلة كاملة:
https://github.com/ahmedadel099/svg_splitter

#Flutter #Dart #OpenSource #SVG #Theming #MultiTenant #MobileDevelopment #SoftwareEngineering
```

### Option 2: Story Format (Best for Engagement)

```
🚀 قصة أداة صغيرة خلت حياتنا أسهل في التطبيق اللي بنطوره

كنا بنطور تطبيق كبير (over-engineered بس شغال! 😄) بيخدم أكتر من شركة. 
كل شركة عندها Brand identity مختلفة وكلها عايزة الأيقونات تظهر بألوان Theme الخاص بيها.

المشكلة كانت إن الأيقونات عندها أجزاء:
• أجزاء ثابتة (زي الإطار الرمادي) - لازم تفضل زي ما هي
• أجزاء ديناميكية (زي القلب الأحمر) - لازم تتغير مع Theme الشركة

بدل ما نعمل 1000 نسخة من نفس الأيقونة لكل theme ممكن... عملت أداة بتعمل الـ split تلقائياً! 🤖

SVG Splitter 🎨
أداة Dart CLI بسيطة بتقسم أي SVG لأجزاء ثابتة وديناميكية تلقائياً، وبتسمح للأجزاء الديناميكية تتغير مع Theme الشركة في Flutter.

كيف بتشتغل؟
1️⃣ بتاخد SVG أيقونة من Figma
2️⃣ بتقسمها تلقائياً لأجزاء ثابتة وديناميكية
3️⃣ الأجزاء الديناميكية بتتغير مع Theme الشركة في Flutter
4️⃣ الأجزاء الثابتة بتفضل زي ما هي

النتيجة؟ كود أنظف، صيانة أسهل، ومرونة أكبر! 🎯

🔗 Package: https://pub.dev/packages/svg_splitter
💻 Source code & Examples: https://github.com/ahmedadel099/svg_splitter

#FlutterDevelopment #Dart #OpenSource #SVG #MobileApp #SoftwareEngineering #MultiTenant
```

---

## 🇬🇧 English Version

### Option 1: Problem-Solution Format (Recommended)

```
🎨 Solving Multi-Tenant App Theming Challenges with SVG Splitter

Working on a multi-tenant application where each company needs its own branded theme, we faced a tricky problem with icons:
Some parts should remain static (like gray borders), while others need to change dynamically based on each company's theme.

The Challenge:
• Icons have static parts (e.g., gray frames) that must stay unchanged
• Dynamic parts (e.g., red hearts) that should change with each company's theme
• Creating 1000 copies of the same icon for every possible theme? No way! 😅

The Solution:
I built SVG Splitter 🚀 - a simple Dart CLI tool that:
• Automatically splits SVG files into static and dynamic parts
• Allows dynamic parts to change with the company's theme in Flutter
• Keeps static parts unchanged

Results:
✅ 100% dynamic icons without code duplication
✅ Clean, maintainable, and flexible codebase
✅ Unlimited theme support
✅ Zero dependencies - Pure Dart

🔗 Available on pub.dev:
https://pub.dev/packages/svg_splitter

💻 Open source on GitHub with full examples:
https://github.com/ahmedadel099/svg_splitter

#Flutter #Dart #OpenSource #SVG #Theming #MultiTenant #MobileDevelopment #SoftwareEngineering
```

### Option 2: Story Format (Best for Engagement)

```
🚀 Building SVG Splitter: A Tool That Made Our Multi-Tenant App Development Easier

Working on a large multi-tenant application (yes, it's over-engineered but it works! 😄), we needed a solution where each company gets their own branded icons while sharing the same codebase.

The Problem:
• Icons have static parts (gray frames) that must stay unchanged
• Dynamic parts (red hearts) that need to change with each company's theme
• Creating hundreds of icon variants? Not scalable!

Instead of manually creating 1000 copies of the same icon... I built SVG Splitter! ✂️

How it works:
1️⃣ Export your SVG icon from Figma
2️⃣ Run the tool - it automatically splits into static & dynamic parts
3️⃣ Dynamic parts change with the company's theme in Flutter
4️⃣ Static parts remain unchanged

The result? Cleaner code, easier maintenance, and unlimited flexibility! 🎯

🔗 Package: https://pub.dev/packages/svg_splitter
💻 Source code & Examples: https://github.com/ahmedadel099/svg_splitter

#FlutterDevelopment #Dart #OpenSource #SVG #MobileApp #SoftwareEngineering #MultiTenant #B2BSaaS
```

### Option 3: Technical Focus

```
🎯 Solving Dynamic Theming Challenges in Multi-Tenant Flutter Applications

In multi-tenant applications, managing icons and visual assets that adapt to each company's theme is a common challenge.

Technical Challenge:
• Complex icons contain both static (unchanged) and dynamic (theme-based) parts
• Dynamic parts must change with the company's theme
• Static parts must remain unchanged

Solution: SVG Splitter 🛠️

A Dart CLI tool that performs automatic SVG splitting, separating static parts from dynamic ones, enabling dynamic parts to change with the app's theme while keeping static parts consistent.

Features:
✅ Automatic detection of dynamic colors
✅ Customizable color detection via CLI flags
✅ Zero dependencies - Pure Dart
✅ Easy integration with Flutter widgets
✅ Complete example app included

Use Case:
Perfect for B2B SaaS applications, multi-brand platforms, and any app requiring dynamic theming while maintaining static visual elements.

🔗 Package: https://pub.dev/packages/svg_splitter
📚 Documentation & Examples: https://github.com/ahmedadel099/svg_splitter

#Flutter #Dart #MobileDevelopment #SVG #Theming #MultiTenantApplications #OpenSource #B2BSaaS
```

---

## 📊 Recommendations

**For Arabic LinkedIn:**
- **Option 2** (Story Format) - Best engagement, tells the story naturally
- **Option 1** - More structured, professional tone

**For English LinkedIn:**
- **Option 2** (Story Format) - Best for engagement and shares
- **Option 1** - Balanced professional and approachable
- **Option 3** - For technical/engineering-focused audience

**Tips:**
- Add a demo GIF/video to increase engagement
- Post during peak hours (10 AM - 12 PM, 5 PM - 7 PM your timezone)
- Engage with comments within the first hour
- Share in relevant Flutter/Dart communities

---

## 📝 Quick Copy-Paste Ready

### Arabic (Option 2 - Recommended):
```
🚀 قصة أداة صغيرة خلت حياتنا أسهل في التطبيق اللي بنطوره

كنا بنطور تطبيق كبير (over-engineered بس شغال! 😄) بيخدم أكتر من شركة. 
كل شركة عندها Brand identity مختلفة وكلها عايزة الأيقونات تظهر بألوان Theme الخاص بيها.

المشكلة كانت إن الأيقونات عندها أجزاء:
• أجزاء ثابتة (زي الإطار الرمادي) - لازم تفضل زي ما هي
• أجزاء ديناميكية (زي القلب الأحمر) - لازم تتغير مع Theme الشركة

بدل ما نعمل 1000 نسخة من نفس الأيقونة لكل theme ممكن... عملت أداة بتعمل الـ split تلقائياً! 🤖

SVG Splitter 🎨
أداة Dart CLI بسيطة بتقسم أي SVG لأجزاء ثابتة وديناميكية تلقائياً، وبتسمح للأجزاء الديناميكية تتغير مع Theme الشركة في Flutter.

كيف بتشتغل؟
1️⃣ بتاخد SVG أيقونة من Figma
2️⃣ بتقسمها تلقائياً لأجزاء ثابتة وديناميكية
3️⃣ الأجزاء الديناميكية بتتغير مع Theme الشركة في Flutter
4️⃣ الأجزاء الثابتة بتفضل زي ما هي

النتيجة؟ كود أنظف، صيانة أسهل، ومرونة أكبر! 🎯

🔗 Package: https://pub.dev/packages/svg_splitter
💻 Source code & Examples: https://github.com/ahmedadel099/svg_splitter

#FlutterDevelopment #Dart #OpenSource #SVG #MobileApp #SoftwareEngineering #MultiTenant
```

### English (Option 2 - Recommended):
```
🚀 Building SVG Splitter: A Tool That Made Our Multi-Tenant App Development Easier

Working on a large multi-tenant application (yes, it's over-engineered but it works! 😄), we needed a solution where each company gets their own branded icons while sharing the same codebase.

The Problem:
• Icons have static parts (gray frames) that must stay unchanged
• Dynamic parts (red hearts) that need to change with each company's theme
• Creating hundreds of icon variants? Not scalable!

Instead of manually creating 1000 copies of the same icon... I built SVG Splitter! ✂️

How it works:
1️⃣ Export your SVG icon from Figma
2️⃣ Run the tool - it automatically splits into static & dynamic parts
3️⃣ Dynamic parts change with the company's theme in Flutter
4️⃣ Static parts remain unchanged

The result? Cleaner code, easier maintenance, and unlimited flexibility! 🎯

🔗 Package: https://pub.dev/packages/svg_splitter
💻 Source code & Examples: https://github.com/ahmedadel099/svg_splitter

#FlutterDevelopment #Dart #OpenSource #SVG #MobileApp #SoftwareEngineering #MultiTenant #B2BSaaS
```





