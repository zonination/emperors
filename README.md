# Roman Emperors from 26 BC to 395 AD

Data verification is in progress. Data rows 1 through 1 are correct.

## Data Notes

### Year Issues

Since these sources are from ancient texts, there are a certain number of unknown dates. Below are some notes on how `birth`, `death`, `reign.start`, and `reign.end`. were calculated:

* If the *year* of the date was known, but not the *day* or *month*, the start of the year was taken.
* If the *year and month* of the date was known, but not the *day*, the middle of the month was taken (14 for February, 15 for other months).
* If *two dates were given*, due to inconsistencies with ancient sources, then:
    * In the case it was `birth` or `reign.start`, the earlier date was chosen.
    * In the case it was `death` or `reign.end`, the later date was chosen.
* If the *year and one of two possible months* of the date was known, but not the day, the first date of the second month was chosen (middle of the two options).
* If the date was BCE, the following actions were performed:
    * The year was made positive
    * The year had 1 year subtracted from its absolute value, to make it consistent with [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601#Years) (e.g. 1AD = 0001, 1BC = 0000, 2BC = 0001, 3BC = 0002, ...).
    * The "notes" column will state BCE date.
    * The code in `emperors.R` was modified to invert the sign of that specific value (e.g. 1AD = 0001, 1BC = 0000, 2BC = -001, 3BC = -002, ...) to complete the process of ISO 8601 compatibility.

### Cause of Death Definitions

In the `cause` column, an emperor's death probably needs clarifying in some instances:

* **Suicide** in antiquity was generally a political move, and was often committed in instances where there was strong political pressure. This could either be **Voluntary** or **Forced**. [[Further Reading](https://en.wikipedia.org/wiki/Suicide_in_antiquity#Ancient_reasons_for_committing_suicide)]
* **Assassination** occurred when a homicide was committed against an emperor *outside* due process law.
* **Execution** occurred when a homicide was committed against an emperor *within* due process of law.
* **Died in Battle** occurred when a homicide was committed against an emperor during battle or as a result of battle.

### Killers

In the `killer` column, we are concerned with **who** killed the emperor or **the root cause**, *not what* as with `cause`. Some definitions that might need clarification:

* **Successor** doesn't necessarily mean that the person who committed homicide was younger than the victim. It simply indicates that a current emperor was vying for power.

### Succession

In the `succession` column, an emporor's rise to power occurred in one of the following situations:

* **Birthright** - Cases in which an emperor's lineage was the determining factor in their control of the Empire, with little conflict.
* **Seized Power** - Cases in which an emporor used violent force to seize the Empire.
* **Appointment by X** - Cases in which an emperor was appointed by an **Army**, the **Senate**, or **Praetorian Guard**.
