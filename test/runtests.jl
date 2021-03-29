using HalfIntegers, Test

# write your own tests here
@test Half(3) == 1.5
@test Half(3) + Half(1) == 2
@test Half(2) + 1 == 2
@test 1 + Half(2) == 2
@test Half(2) + 1.0 == 2
@test 1.0 + Half(2) == 2
