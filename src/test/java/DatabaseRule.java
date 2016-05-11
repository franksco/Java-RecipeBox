import org.junit.rules.ExternalResource;
import org.sql2o.*;
import spark.Spark;

public class DatabaseRule extends ExternalResource {

  @Override
  protected void before() {
    DB.sql2o = new Sql2o("jdbc:postgresql://localhost:5432/recipe_box", null, null);
  }

  @Override
  protected void after() {
    try(Connection con = DB.sql2o.open()) {
      String deleteIngredientsQuery = "DROP TABLE ingredients;";
      String deleteRecipesQuery = "DROP TABLE recipes;";
      String deleteCategoriesQuery = "DROP TABLE categories;";
      String p = "DROP TABLE directions;";
      String deleteRecipesIngredientsQuery = "DROP TABLE recipe_ingredients;";
      String q = "DROP TABLE recipe_directions;";
      String deleteCategoryRecipeQuery = "DROP TABLE category_recipe;";

      String g = "CREATE TABLE ingredients (id serial PRIMARY KEY, ingredient varchar);";
      String t = "CREATE TABLE directions (id serial PRIMARY KEY, direction varchar);";
      String x = "CREATE TABLE recipes (id serial PRIMARY KEY, name varchar); ";
      String y = "CREATE TABLE categories (id serial PRIMARY KEY, name varchar);";
      String a = "CREATE TABLE recipe_ingredients (id serial PRIMARY KEY, recipe_id int, ingredient_id int);";
      String d = "CREATE TABLE recipe_directions (id serial PRIMARY KEY, recipe_id int, direction_id int);";
      String b = "CREATE TABLE category_recipe (id serial PRIMARY KEY, category_id int, recipe_id int)";

      con.createQuery(deleteIngredientsQuery).executeUpdate();
      con.createQuery(deleteRecipesQuery).executeUpdate();
      con.createQuery(deleteCategoriesQuery).executeUpdate();
      con.createQuery(p).executeUpdate();
      con.createQuery(deleteRecipesIngredientsQuery).executeUpdate();
      con.createQuery(q).executeUpdate();
      con.createQuery(deleteCategoryRecipeQuery).executeUpdate();

      con.createQuery(g).executeUpdate();
      con.createQuery(t).executeUpdate();
      con.createQuery(x).executeUpdate();
      con.createQuery(y).executeUpdate();
      con.createQuery(a).executeUpdate();
      con.createQuery(d).executeUpdate();
      con.createQuery(b).executeUpdate();
    }
  }

}
