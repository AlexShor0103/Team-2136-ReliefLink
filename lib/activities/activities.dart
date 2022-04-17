class Activity {
  String name;
  int duration;
  String mood;
  Function listenerFunction;
  Activity(this.name, this.duration, this.mood, this.listenerFunction);
}
Function defaultHandler = () {};
Function meditationHandler = () {print(5);};
List<Activity> activities = [
          new Activity("Progressive Muuscle Relaxation", 30, "Anxious", defaultHandler),
          new Activity("Walking", 30, "Sleepless", defaultHandler),
          new Activity("Talking to someone", 30, "Anxious", defaultHandler),
          new Activity("Play volleyball", 60, "Energetic", defaultHandler),
            new Activity("Meditation", 30, "Sleepless", meditationHandler),
            new Activity("Guided Imagery", 60, "Sleepless", defaultHandler),
            
            
            
            new Activity("Listen to Music", 60, "Other", defaultHandler),
            
            new Activity("Watch a Movie", 60, "Energetic", defaultHandler)

                    ];


