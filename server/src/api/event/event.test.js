const app = require("../../app");
const request = require("supertest");
const { log } = require("console");
const utils = require("../../utils");
const types = require("../../config/types.config");

describe("GET /api/events", () => {
  let server; // Declare a variable to hold the server instance

  beforeAll(() => {
    server = app.listen(8000); // Start the server before running tests
  });

  afterAll((done) => {
    server.close(done); // Close the server after all tests are done
  });

  test("Get all events without query string", async () => {
    const { statusCode, body } = await request(app).get("/api/events");

    const returnBody = body.body.body;
    expect(statusCode).toBe(200);
    expect(body.body.status).toBe(true);
    expect(body.body.message).toBe("success get all events");
    expect(returnBody).toBeInstanceOf(Array);
    expect(typeof returnBody[0].id).toBe("number");
    expect(typeof returnBody[0].userId).toBe("number");
    expect(typeof returnBody[0].title).toBe("string");
    expect(typeof returnBody[0].imageUrl).toBe("string");
    expect(new Date(returnBody[0].datetime)).toBeInstanceOf(Date);
    expect(Object.values(types.eventCity)).toContain(returnBody[0].city);
    expect(typeof returnBody[0].ticketPrice).toBe("number");
    expect(typeof returnBody[0].capacity).toBe("number");
    expect(Object.values(types.eventCategory)).toContain(
      returnBody[0].category
    );
    expect(returnBody[0].status).toBe(types.status.verified);
    expect(new Date(returnBody[0].createdAt)).toBeInstanceOf(Date);
    expect(returnBody[0]).toHaveProperty("description");
    expect(returnBody[0]).toHaveProperty("locationDetail");
  }, 30000);

  test("Get all events with pagination (limit and page query)", async () => {
    const { statusCode, body } = await request(app).get(
      "/api/events?page=2&limit=3"
    );

    const returnBody = body.body.body;
    expect(statusCode).toBe(200);
    expect(body.body.status).toBe(true);
    expect(body.body.message).toBe("success get all events");
    expect(returnBody).toBeInstanceOf(Array);
    expect(returnBody.length).toBe(3);
  }, 30000);

  test("Get all events with category filter", async () => {
    const { statusCode, body } = await request(app).get(
      "/api/events?category=SPORTS"
    );

    const returnBody = body.body.body;
    expect(statusCode).toBe(200);
    expect(body.body.status).toBe(true);
    expect(body.body.message).toBe("success get all events");
    expect(returnBody).toBeInstanceOf(Array);
    expect(returnBody[0].category).toBe(types.eventCategory.sports);
  }, 30000);

  test("Get all events with location filter", async () => {
    const { statusCode, body } = await request(app).get(
      "/api/events?location=BANDUNG"
    );

    const returnBody = body.body.body;
    expect(statusCode).toBe(200);
    expect(body.body.status).toBe(true);
    expect(body.body.message).toBe("success get all events");
    expect(returnBody).toBeInstanceOf(Array);
    expect(returnBody[0].city).toBe(types.eventCity.bandung);
  }, 30000);

  test("Get all events with search query", async () => {
    const { statusCode, body } = await request(app).get(
      "/api/events?search=19"
    );

    const returnBody = body.body.body;
    expect(statusCode).toBe(200);
    expect(body.body.status).toBe(true);
    expect(body.body.message).toBe("success get all events");
    expect(returnBody).toBeInstanceOf(Array);
    expect(returnBody[0].title).toContain("19");
  }, 30000);

  test("Get all events with ascending order", async () => {
    const { statusCode, body } = await request(app).get(
      "/api/events?sort=asc"
    );

    const returnBody = body.body.body;
    expect(statusCode).toBe(200);
    expect(body.body.status).toBe(true);
    expect(body.body.message).toBe("success get all events");
    expect(returnBody).toBeInstanceOf(Array);
    expect(utils.isGreaterThan(returnBody[1].createdAt, returnBody[0].createdAt)).toBe(true);
  }, 30000);

  test("Get all events within range of time", async () => {
    const { statusCode, body } = await request(app).get(
      "/api/events?date_lte=2023-08-30&date_gte=2023-08-01"
    );

    const returnBody = body.body.body;
    expect(statusCode).toBe(200);
    expect(body.body.status).toBe(true);
    expect(body.body.message).toBe("success get all events");
    expect(returnBody).toBeInstanceOf(Array);
    expect(utils.isGreaterThan("2023-08-31", returnBody[0].createdAt)).toBe(true);
    expect(utils.isGreaterThan(returnBody[returnBody.length - 1].createdAt, "2023-07-31")).toBe(true);
  }, 30000);

});
