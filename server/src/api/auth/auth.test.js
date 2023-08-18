const app = require("../../app");
const request = require("supertest");
const { log } = require("console");

describe("POST /api/auth/register", () => {
  let server; // Declare a variable to hold the server instance

  beforeAll(() => {
    server = app.listen(8000); // Start the server before running tests
  });

  afterAll((done) => {
    server.close(done); // Close the server after all tests are done
  });

  const userMock = {
    email: "mockuser2@gmail.com",
    fullname: "mock user",
    password: "12345678",
    role: "USER",
    age: 31,
  };

  test("register an user using correct input", async () => {
    const { statusCode, body } = await request(app)
      .post("/api/auth/register")
      .send(userMock);
    expect(statusCode).toBe(201);
    expect(body.body.status).toBe(true);
    expect(body.body.body.email).toBe(userMock.email);
    expect(body.body.body.fullname).toBe(userMock.fullname);
    expect(body.body.body.role).toBe(userMock.role);
    expect(body.body.body.age).toBe(userMock.age);
    expect(body.body.body.status).toBe("VERIFIED");
  }, 15000);

  test("register an EO using correct input", async () => {
    const { statusCode, body } = await request(app)
      .post("/api/auth/register")
      .send({ ...userMock, email: "mockeo2@gmail.com", role: "EO" });
    expect(statusCode).toBe(201);
    expect(body.body.status).toBe(true);
    expect(body.body.body.email).toBe("mockeo2@gmail.com");
    expect(body.body.body.fullname).toBe(userMock.fullname);
    expect(body.body.body.role).toBe("EO");
    expect(body.body.body.age).toBe(userMock.age);
    expect(body.body.body.status).toBe("PENDING");
  }, 15000);

  test("register using already used email", async () => {
    const { statusCode, body } = await request(app)
      .post("/api/auth/register")
      .send(userMock);
    expect(statusCode).toBe(400);
    expect(body.body.status).toBe(false);
    expect(body.body.message).toBe("User with that email already exist");
  }, 15000);

  test("register using empty email", async () => {
    const { statusCode, body } = await request(app)
      .post("/api/auth/register")
      .send({ ...userMock, email: "" });
    expect(statusCode).toBe(422);
    expect(body.body.status).toBe(false);
    expect(body.body.message).toBe("Body request error");
    expect(body.body.body[0].path).toBe("email");
    expect(body.body.body[0].msg).toBe("Email is required.");
  }, 15000);


  test("register using incorrect email", async () => {
    const { statusCode, body } = await request(app)
      .post("/api/auth/register")
      .send({ ...userMock, email: "@gmail.com" });
    expect(statusCode).toBe(422);
    expect(body.body.status).toBe(false);
    expect(body.body.message).toBe("Body request error");
    expect(body.body.body[0].path).toBe("email");
    expect(body.body.body[0].msg).toBe("Please Enter valid email.");
  }, 15000);

  test("register using incorrect fullname", async () => {
    const { statusCode, body } = await request(app)
      .post("/api/auth/register")
      .send({ ...userMock, fullname: "Ahmad+Joni!" });
    expect(statusCode).toBe(422);
    expect(body.body.status).toBe(false);
    expect(body.body.message).toBe("Body request error");
    expect(body.body.body[0].path).toBe("fullname");
    expect(body.body.body[0].msg).toBe("Fullname can only contain letter, number, white space, and underscore");
  }, 15000);

  test("register using fullname under 4 length", async () => {
    const { statusCode, body } = await request(app)
      .post("/api/auth/register")
      .send({ ...userMock, fullname: "abc" });
    expect(statusCode).toBe(422);
    expect(body.body.status).toBe(false);
    expect(body.body.message).toBe("Body request error");
    expect(body.body.body[0].path).toBe("fullname");
    expect(body.body.body[0].msg).toBe(
      "Fullname must atleast 4 characters and maximal of 80 characters."
    );
  }, 15000);

  test("register using password under 8 length", async () => {
    const { statusCode, body } = await request(app)
      .post("/api/auth/register")
      .send({ ...userMock, password: "abc" });
    expect(statusCode).toBe(422);
    expect(body.body.status).toBe(false);
    expect(body.body.message).toBe("Body request error");
    expect(body.body.body[0].path).toBe("password");
    expect(body.body.body[0].msg).toBe(
      "Password must atleast 8 characters and maximal of 20 characters."
    );
  }, 15000);

  test("register using minus age", async () => {
    const { statusCode, body } = await request(app)
      .post("/api/auth/register")
      .send({ ...userMock, age: -100});
    expect(statusCode).toBe(422);
    expect(body.body.status).toBe(false);
    expect(body.body.message).toBe("Body request error");
    expect(body.body.body[0].path).toBe("age");
    expect(body.body.body[0].msg).toBe(
      "Please enter valid age."
    );
  }, 15000);

  test("register using role other than EO or USER", async () => {
    const { statusCode, body } = await request(app)
      .post("/api/auth/register")
      .send({ ...userMock, role: "ADMIN"});
    expect(statusCode).toBe(422);
    expect(body.body.status).toBe(false);
    expect(body.body.message).toBe("Body request error");
    expect(body.body.body[0].path).toBe("role");
    expect(body.body.body[0].msg).toBe(
      "Role must USER or EO."
    );
  }, 15000);


});
