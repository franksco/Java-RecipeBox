import java.util.HashMap;
import spark.ModelAndView;
import spark.template.velocity.VelocityTemplateEngine;
import static spark.Spark.*;
import java.util.*;

public class App {
  public static void main(String[] args) {
    staticFileLocation("/public");
    String layout = "templates/layout.vtl";

    get("/", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      model.put("template", "templates/index.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/categories", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      model.put("categories", Category.all());
      model.put("template", "templates/categories.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/recipes/new", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      model.put("template", "templates/recipe-form.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/recipes/:id", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      Recipe recipe = Recipe.find(Integer.parseInt(request.params("id")));
      model.put("recipe", recipe);
      model.put("template", "templates/recipe.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/recipe", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      String name = request.queryParams("name");
      String ingredients = request.queryParams("ingredients");
      String directions = request.queryParams("directions");
      List<String> arrayOfIngred = new ArrayList<String>(Arrays.asList(ingredients.split("\\n")));
      List<String> arrayOfDirect = new ArrayList<String>(Arrays.asList(directions.split("\\n")));
      Recipe newRecipe = new Recipe(name, arrayOfDirect, arrayOfIngred);
      newRecipe.save();
      response.redirect("/recipes/" + Integer.toString(newRecipe.getId()));
      return null;
    });

    // get("/tasks/:id", (request,response) -> {
    //   HashMap<String, Object> model = new HashMap<String, Object>();
    //   Task task = Task.find(Integer.parseInt(request.params("id")));
    //   model.put("task", task);
    //   model.put("allCategories", Category.all());
    //   model.put("template", "templates/task.vtl");
    //   return new ModelAndView(model, layout);
    // }, new VelocityTemplateEngine());
    //
    // get("/tasks/edit/:id", (request,response) -> {
    //   HashMap<String, Object> model = new HashMap<String, Object>();
    //   Task task = Task.find(Integer.parseInt(request.params("id")));
    //   model.put("task", task);
    //   model.put("template", "templates/edit-task.vtl");
    //   return new ModelAndView(model, layout);
    // }, new VelocityTemplateEngine());
    //
    // get("/categories/:id", (request,response) ->{
    //   HashMap<String, Object> model = new HashMap<String, Object>();
    //   Category category = Category.find(Integer.parseInt(request.params("id")));
    //   model.put("category", category);
    //   model.put("allTasks", Task.all());
    //   model.put("template", "templates/category.vtl");
    //   return new ModelAndView(model, layout);
    // }, new VelocityTemplateEngine());
    //
    // get("/categories/edit/:id", (request,response) -> {
    //   HashMap<String, Object> model = new HashMap<String, Object>();
    //   Task task = Task.find(Integer.parseInt(request.params("id")));
    //   model.put("task", task);
    //   model.put("template", "templates/edit-category.vtl");
    //   return new ModelAndView(model, layout);
    // }, new VelocityTemplateEngine());
    //
    // post("/tasks", (request, response) -> {
    //   HashMap<String, Object> model = new HashMap<String, Object>();
    //   String description = request.queryParams("description");
    //   String duedate = request.queryParams("duedate");
    //   Task newTask = new Task(description, duedate);
    //   newTask.save();
    //   response.redirect("/tasks");
    //   return null;
    // });
    //
    // post("/categories", (request, response) -> {
    //   HashMap<String, Object> model = new HashMap<String, Object>();
    //   String name = request.queryParams("name");
    //   Category newCategory = new Category(name);
    //   newCategory.save();
    //   response.redirect("/categories");
    //   return null;
    // });
    //
    // post("delete/:id", (request, response) -> {
    //   HashMap<String, Object> model = new HashMap<String, Object>();
    //   Task task;
    //   int n = Integer.parseInt(request.queryParams("type"));
    //   String id = request.queryParams("id");
    //   switch(n){
    //     case 1:
    //       task = Task.find(Integer.parseInt(request.params("id")));
    //       task.delete();
    //       response.redirect("/tasks");
    //       break;
    //     case 2:
    //       task = Task.find(Integer.parseInt(request.params("id")));
    //       task.delete();
    //       response.redirect("/categories/" + id);
    //       break;
    //     case 3:
    //       Category category = Category.find(Integer.parseInt(request.params("id")));
    //       category.delete();
    //       response.redirect("/categories");
    //       break;
    //     default:
    //       response.redirect("/");
    //       break;
    //   }
    //
    //   return null;
    // });
    //
    // post("complete/:id", (request, response) -> {
    //   HashMap<String, Object> model = new HashMap<String, Object>();
    //   int n = Integer.parseInt(request.queryParams("type"));
    //   String id = request.queryParams("id");
    //   Task task = Task.find(Integer.parseInt(request.params("id")));
    //   task.complete();
    //   switch(n){
    //     case 1:
    //       response.redirect("/tasks");
    //       break;
    //     case 2:
    //       response.redirect("/categories/" + id);
    //       break;
    //     case 3:
    //       response.redirect("/tasks/" + request.params("id"));
    //     default:
    //       response.redirect("/");
    //       break;
    //   }
    //   return null;
    // });
    //
    // post("/add_tasks", (request, response) -> {
    //   int taskId = Integer.parseInt(request.queryParams("task_id"));
    //   int categoryId = Integer.parseInt(request.queryParams("category_id"));
    //   Category category = Category.find(categoryId);
    //   Task task = Task.find(taskId);
    //   category.addTask(task);
    //   response.redirect("/categories/" + categoryId);
    //   return null;
    // });
    //
    // post("/tasks-update/:id", (request, response) -> {
    //   String description = request.queryParams("description");
    //   String duedate = request.queryParams("duedate");
    //   Task task = Task.find(Integer.parseInt(request.params("id")));
    //   task.update(description, duedate);
    //   response.redirect("/tasks");
    //   return null;
    // });
    //
    // post("/add_categories", (request, response) -> {
    //   int taskId = Integer.parseInt(request.queryParams("task_id"));
    //   int categoryId = Integer.parseInt(request.queryParams("category_id"));
    //   Category category = Category.find(categoryId);
    //   Task task = Task.find(taskId);
    //   task.addCategory(category);
    //   response.redirect("/tasks/" + taskId);
    //   return null;
    // });

  }
}
