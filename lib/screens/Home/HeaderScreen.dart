import 'package:flutter/material.dart';
import 'package:flutter_foodapp/Delegates/search_recipe.dart';
import 'package:flutter_foodapp/Model/constant.dart';
import 'package:flutter_foodapp/screens/DetailsScreen/searchDetails.dart';

class HeaderScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 130,),
          Text("What would you\nwant to cook Today?",
            style: TextStyle(
              fontSize: 26,
              color: Colors.white,),
            textAlign: TextAlign.center,),
          SizedBox(height: 15,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 18),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
              child: TextField(
                onTap: () => showSearch(context: context, delegate: SearchRecipeItem()),
                
                style: dropDownMenuItemStyle,
                readOnly: true,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                  hintText: 'Search Recipes...',
                  suffixIcon: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(30.0),),
                    child: Icon(Icons.search, color: Colors.black,),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );


}


class SearchRecipeItem extends SearchDelegate<SearchRecipe>{
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: (){
      query ="";
    },)];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final mylist = query.isEmpty? demoRecipe
        : demoRecipe.where((p) => p.title.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: mylist.length,
      itemBuilder: (context, index){
        final SearchRecipe demoRecipe = mylist[index];
        return ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchDetails(
                    recipe: SearchRecipe.demoRecipe[index],
                  ),
                )),
            title: Container(
              height: 120,
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 120,
                        child: Image.asset(demoRecipe.imgPath),
                      ),
                      SizedBox(width: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [
                            Column(
                              children: [
                                Text(demoRecipe.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
                                    Text(demoRecipe.subtitle, style: TextStyle(fontSize: 18, color: Colors.grey),),
                                    SizedBox(width: 10,),
                                    Icon(Icons.timer, color: Colors.grey,),
                                    SizedBox(width: 4,),
                                    Text(demoRecipe.cookingTime, ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
        );
      },
    );
  }

  static List<SearchRecipe> demoRecipe = [
    SearchRecipe(
      title: 'Poha',
      subtitle: 'Breakfast',
      cookingTime: '30 min ',
      servings: 2,
      imgPath: 'assets/images/poha.jpg',
      ingredients: [
        '3 cup poha',
        '2 tsp sugar',
        '1.5 tsp salt',
        '4 tbsp oil',
        '2 tsp mustard',
        '2 tsp cumin / jeera',
        'pinch hing / asafoetida',
        'few curry leaves',
        '2 onion (finely chopped)',
        '4 chilli (finely chopped)',
        '0.5 tsp turmeric',
        '4 tbsp coconut (grated)',
        '4 tbsp coriander (finely chopped)',
        '4 tsp lemon juice'
      ],
      preparation: [
        '1. Firstly, add 1 tsp sugar and ¾ tsp salt on soaked poha and mix gently.',
        '2. In a large kadai heat 2 tbsp oil and roast  2 tbsp peanuts on low flame.',
        '3. Roast until the peanuts turn crunchy. keep aside.',
        '4. In the same oil, splutter 1 tsp mustard, 1 tsp cumin, pinch hing and few curry leaves.',
        '5. Further add 1 onion, 2 chilli and saute well.',
        '6. Saute until onions shrink slightly without browning.',
        '7. Further, add ¼ tsp turmeric and saute well.',
        '8. Add in soaked poha and mix gently until everything is combined well.',
        '9. Cover and simmer for 5 minutes or until the flavours are absorbed well.',
        '10. Also add 2 tbsp coconut, 2 tbsp coriander and 2 tsp lemon juice. mix gently.',
        '11. finally, enjoy kanda poha topped with some sev.'

      ],
    ),
    SearchRecipe(
      title: 'Rava Idli ',
      subtitle: 'Breakfast',
      cookingTime: '37 min',
      servings: 12,
      imgPath: 'assets/images/rava_idli.jpg',
      ingredients: [
        '1 tablespoon ghee',
        '1 tsp. Dijon mustard',
        'a pinch of hing',
        '½ teaspoon mustard seeds',
        '½ teaspoon cumin seeds',
        '1 teaspoon urad dal',
        '1 teaspoon channa dal',
        '1 tablespoon cashews halved',
        '7-8 curry leaves or kadipatta',
        '2 green chilies finely chopped',
        '1.25 cups sooji semolina (fine or coarse - either will work)',
        '½ cup yogurt',
        '1.5 cups water',
        '1 tablespoon finely chopped cilantro',
        '1 teaspoon salt',
        '2 teaspoons Eno fruit salt',
        '1 teaspoon coconut or olive oil for greasing'
      ],
      preparation: [
        '1. Take some ghee in a non-stick pan and heat over medium heat.',
        '2. Prepare the tempering by adding asafoetida(hing), mustard seeds and cumin seeds to the ghee. Once these start to sputter, add urad dal, channa dal, green chilies, curry leaves to the tempering and stir fry them for 10-20 seconds.',
        '3. Next, add sooji (semolina) and fry stirring constantly for about two minutes till it starts to change color and turns aromatic.',
        '4. Take the mixture off the heat and set aside to cool for about 5-10 minutes.',
        '5. Mix in salt, yogurt, and water (about 1.5 cups or as required) to form the batter. Cover the batter and let it rest for about half an hour.',
        '6. After about 30 minutes, the semolina would have soaked up most of the liquid. The batter is now ready to make the idlis.',
        '7. Add 1 cup of water in the idli steamer. Heat it over medium heat till the water starts to boil.',
        '8. Mix in Eno fruit salt to the semolina batter until the batter turns light and foamy. Do not over mix.',
        '9. Brush the idli molds with oil or cooking spray and then pour in a ladle full of the prepared batter.',
        '10. Carefully place the idli stand inside the steamer and secure the lid. Steam the idlis for 10 -12 minutes so they are cooked thoroughly.',
        '11. Wait for 5 -10 minutes for the steam to be released before opening the steamer and taking the idli stand out.',
        '12. Let the idlis rest for 5 minutes before taking them out of the molds. Scoop the idlis carefully out of the mold with a sharp knife.',
        '13. Serve it with coconut chutney or red coconut chutney or piping hot sambar.'
      ],
    ),
    SearchRecipe(
      title: 'Upma',
      subtitle: 'Breakfast',
      cookingTime: '15 min',
      servings: 3,
      imgPath: 'assets/images/upma.jpg',
      ingredients: [
        '3 cup rava / semolina / sooji',
        '6 tbsp oil',
        '3 tsp mustard / rai / sasuve',
        ' 1.5 tsp chana dal (optional)',
        '1.5 tsp urad dal',
        '3 dried red chilli',
        'few curry leaves',
        '1.5 onion (finely chopped)',
        '6 green chilli (finely chopped)',
        '3 inch ginger (finely chopped)',
        '9 cups water',
        '1.5 tsp sugar',
        '1.5 tsp salt',
        '3 tsp ghee / clarified butter',
        '1.5 lemon juice',
        '6 tbsp coriander (finely chopped)'
      ],
      preparation: [
        '1. Firstly, dry roast 1 cup bombay rava on low flame for 2-3 minutes. keep aside to cool completely.',
        '2. Now in a large kadai heat 2 tbsp oil and add 1 tsp mustard, ½ tsp urad dal, 1 dried red chilli and few curry leaves. also add jeera for more flavour.',
        '3. Now saute till the mustard seeds splutter.',
        '4. Add in ½ onion and saute well.',
        '5. Also saute 2 green chilli and 1 inch ginger.',
        '6. Now pour 3 cups water and get to vigorous boil.',
        '7. Further add ½ tsp sugar, ½ tsp salt and 1 tsp ghee. mix well.',
        '8. Keeping the flame on low start adding roasted rava slowly, stirring continuously in another hand.',
        '9. This helps to prevent from any lumps formation.',
        '10. Now mix continuously till the rava absorbs water.',
        '11. Cover and simmer on low flame for 5 minutes or till upma is cooked well.',
        '12. Furthermore add ½ lemon juice and 2 tbsp coriander leaves. mix well.',
        '13. Finally, serve rava upma / uppittu with coconut chutney or plain.'
      ],
    ),
    SearchRecipe(
      title: 'Tomato Soup',
      subtitle:
      'A touch of Dijon mustard, salty bacon, melty cheese, and a handful of greens seriously upgrades scrambled eggs, without too much effort!',
      cookingTime: '25 min ',
      servings: 2,
      imgPath: 'assets/images/tomato_soup.png',
      ingredients: [
        '2 tsp butter',
        '1 onion (finely chopped)',
        '4 clove garlic',
        '2 bay leaf / tej patta',
        '6 tomato (chopped)',
        '1 carrot ( chopped)',
        '1 tsp salt',
        '2 cup water',
        '2 tsp sugar',
        '1 tsp pepper (crushed)',
        '4 tbsp cream / malai',
      ],
      preparation: [
        '1. firstly, in a kadai heat 1 tsp butter and saute ½ onion, 2 clove garlic and 1 bay leaf.',
        '2. add 3 tomato, ½ carrot chopped and ½ tsp salt.',
        '3. saute for a minute or till tomatoes change colour.',
        '4. add ½ cup water, cover and boil for 10 minutes.',
        '5. boil till tomatoes turn soft and mushy.',
        '6. now remove the bay leaf and cool the mixture.',
        '7. blend to smooth paste without adding any water.',
        '8. now sieve the tomato paste discarding the residue.',
        '9. add ½ cup water or more adjusting consistency.',
        '10. get the soup to a boil and add 1 tsp sugar, ½ tsp pepper and ¼ tsp salt.',
        '11. mix well making sure all the spices are combined well.'
        '12. turn off the flame and add 2 tbsp cream, mix well.'
        '13. finally serve creamy tomato soup garnished with mint leaf and cream.'
      ],
    ),  
  ];
}
