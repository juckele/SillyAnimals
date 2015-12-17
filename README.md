# SillyAnimals
Human readable caching and recall of UUID values.

# Example output

    echo "Hello 21cd5a82-903a-419a-bdd8-2e95b21fdf18  
    35a38a1c-dd3d-45bd-a63f-42815640ad29
    291c3ada-6f02-4bf3-a619-4d7c86703b2f
    c459514e-2715-434e-bf80-aacecc092573 TEST 21cd5a82-903a-419a-bdd8-2e95b21fdf18
    291c3ada-6f02-4bf3-a619-4d7c86703b2f
    c459514e-2715-434e-bf80-aacecc092573 " | ./silly-animals.pl -o

produces

    Hello FierceFox
    WaryDuck
    SkinnyKangaroo
    CarefulIbix TEST FierceFox
    SkinnyKangaroo
    CarefulIbix

# Example input

    ./silly-animals.pl -i FierceFox

produces

    21cd5a82-903a-419a-bdd8-2e95b21fdf18
