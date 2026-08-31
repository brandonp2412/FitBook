# Room 2.6.1 keeps RoomDatabase subclasses but does not retain their
# no-argument constructors. R8 full mode may remove those constructors even
# though Room instantiates generated database implementations reflectively.
# Match the corrected AndroidX Room consumer rule.
-keep class * extends androidx.room.RoomDatabase { void <init>(); }
