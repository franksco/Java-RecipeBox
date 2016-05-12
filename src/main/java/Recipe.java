import java.util.List;
import org.sql2o.*;
import java.util.ArrayList;
import java.text.ParseException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Recipe {
  private int id;
  private int ingredientid;
  private int directionid;
  private String name;
  private List<Integer> checkedTags = new ArrayList<Integer>();
  private List<String> arrayOfIngred = new ArrayList<String>();
  private List<String> arrayOfDirect = new ArrayList<String>();


  public Recipe(String name, List<String> array1, List<String> array2, String[] stringTags) {
    this.name = name;
    this.arrayOfIngred = array2;
    this.arrayOfDirect = array1;
    List<Integer> intTags = new ArrayList<Integer>();
    for(String stringtag : stringTags){
      intTags.add(Integer.parseInt(stringtag));
    }
    this.checkedTags = intTags;

  }

  public String getName() {
    return name;
  }

  public int getId() {
    return id;
  }

  public int getIngredientsId() {
    return ingredientid;
  }

  public int getDirectionId() {
    return directionid;
  }

  // public static List<Recipe> all() {
  //   String sql = "SELECT * FROM recipes ORDER BY directions ASC";
  //   try(Connection con = DB.sql2o.open()) {
  //     return con.createQuery(sql).executeAndFetch(Recipe.class);
  //   }
  // }

  // @Override
  // public boolean equals(Object otherRecipe){
  //   if (!(otherRecipe instanceof Recipe)) {
  //     return false;
  //   } else {
  //     Recipe newRecipe = (Recipe) otherRecipe;
  //     return this.getDescription().equals(newRecipe.getDescription()) &&
  //     this.getId() == newRecipe.getId();
  //   }
  // }

  public void save() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO recipes(name) VALUES (:name)";
      this.id = (int) con.createQuery(sql, true)
      .addParameter("name", this.name)
      .executeUpdate()
      .getKey();

      for (String ingredient : this.arrayOfIngred) {
        String ingredientAdd = "INSERT INTO ingredients (ingredient) VALUES (:ingredient)";
        this.ingredientid = (int) con.createQuery(ingredientAdd , true)
        .addParameter("ingredient", ingredient)
        .executeUpdate()
        .getKey();

        String joinrecipe_ingredientsTableAdd = "INSERT INTO recipe_ingredients (recipe_id, ingredient_id) VALUES (:recipe_id, :ingredient_id)";
        con.createQuery(joinrecipe_ingredientsTableAdd)
        .addParameter("recipe_id", this.getId())
        .addParameter("ingredient_id", this.getIngredientsId())
        .executeUpdate();
      }

      for (String direction : this.arrayOfDirect) {
        String directionAdd = "INSERT INTO directions (direction) VALUES (:direction)";
        this.directionid = (int) con.createQuery(directionAdd , true)
        .addParameter("direction", direction)
        .executeUpdate()
        .getKey();

        String joinrecipe_directionsTableAdd = "INSERT INTO recipe_directions (recipe_id, direction_id) VALUES (:recipe_id, :direction_id)";
        con.createQuery(joinrecipe_directionsTableAdd)
        .addParameter("recipe_id", this.getId())
        .addParameter("direction_id", this.getDirectionId())
        .executeUpdate();
      }

      for (Integer checkedtag : this.checkedTags) {
        String joincategory_recipeTableAdd = "INSERT INTO category_recipe (category_id, recipe_id) VALUES (:category_id, :recipe_id)";
        con.createQuery(joincategory_recipeTableAdd)
        .addParameter("category_id", checkedtag)
        .addParameter("recipe_id", this.getId())
        .executeUpdate();
      }
    }
  }



  // public void delete() {
  //   try(Connection con = DB.sql2o.open()) {
  //     String deleteQuery = "DELETE FROM recipes WHERE id = :id;";
  //       con.createQuery(deleteQuery)
  //         .addParameter("id", this.getId())
  //         .executeUpdate();
  //
  //     String joinDeleteQuery = "DELETE FROM categories_recipes WHERE recipe_id = :recipeId";
  //       con.createQuery(joinDeleteQuery)
  //         .addParameter("recipeId", this.getId())
  //         .executeUpdate();
  //   }
  // }

  public static Recipe find(int id) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM recipes where id=:id";
      Recipe recipe = con.createQuery(sql)
      .addParameter("id", id)
      .executeAndFetchFirst(Recipe.class);
      return recipe;
    }
  }

  public List<String> getIngredients() {
    try(Connection con = DB.sql2o.open()){
      String joinQuery = "SELECT ingredients.ingredient FROM recipes JOIN recipe_ingredients ON (recipes.id = recipe_ingredients.recipe_id) JOIN ingredients ON (recipe_ingredients.ingredient_id = ingredients.id) WHERE recipes.id = :recipe_id";
      List<String> ingredients = con.createQuery(joinQuery)
      .addParameter("recipe_id", this.getId())
      .executeAndFetch(String.class);
      return ingredients;
    }
  }

  public List<String> getDirections() {
    try(Connection con = DB.sql2o.open()){
      String joinQuery = "SELECT directions.direction FROM recipes JOIN recipe_directions ON (recipes.id = recipe_directions.recipe_id) JOIN directions ON (recipe_directions.direction_id = directions.id) WHERE recipes.id = :recipe_id";
      List<String> ingredients = con.createQuery(joinQuery)
      .addParameter("recipe_id", this.getId())
      .executeAndFetch(String.class);
      return ingredients;
    }
  }

}
