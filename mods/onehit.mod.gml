#define init

trace("One HP Equaliy Mod v1.0")

#define step
with(Player){
if "onehit" not in self{
onehit = 0
my_health = 1
maxhealth = 1
}}

with(enemy){
if "onehit" not in self{
onehit = 0
my_health = 1
maxhealth = 1
}}

with(Generator){
if "onehit" not in self{
onehit = 0
my_health = 1
maxhealth = 1
}}

with(Car){
if "onehit" not in self{
onehit = 0
my_health = 1
maxhealth = 1
}}