const app = require("../../app");
const request = require("supertest");
const { log } = require("console");

describe("POST /api/tickets", () => {
  let server; // Declare a variable to hold the server instance

  beforeAll(() => {
    server = app.listen(8000); // Start the server before running tests
  });

  afterAll((done) => {
    server.close(done); // Close the server after all tests are done
  });

  const ticketMock = {
    quantity: 2,
    eventId: 3,
    userId: 1,
  };

  test("Buy a new tickets with correct input", async () => {
    const { statusCode, body } = await request(app)
      .post("/api/tickets")
      .send(ticketMock);

    const returnBody = body.body.body;
    expect(statusCode).toBe(201);
    expect(body.body.status).toBe(true);
    expect(body.body.message).toBe("Success buying tickets");
    expect(typeof returnBody.id).toBe("number");
    expect(returnBody).toMatchObject({
      quantity: ticketMock.quantity,
      eventId: ticketMock.eventId,
      userId: ticketMock.userId,
    });
    expect(typeof returnBody.price).toBe("number");
    expect(new Date(returnBody.createdAt)).toBeInstanceOf(Date);
  }, 30000);

  test("Buy a new tickets with incorrect input", async () => {
    const { statusCode, body } = await request(app)
      .post("/api/tickets")
      .send({ ...ticketMock, quantity: "satu" });

    const returnBody = body.body.body;
    expect(statusCode).toBe(422);
    expect(body.body.status).toBe(false);
    expect(body.body.message).toBe("Body request error");
    expect(returnBody[0].path).toBe("quantity");
    expect(returnBody[0].msg).toBe("Quantity must be an integer");
  }, 30000);

  test("Buy a new tickets with empty input", async () => {
    const { statusCode, body } = await request(app)
      .post("/api/tickets")
      .send({ ...ticketMock, userId: "" });

    const returnBody = body.body.body;
    expect(statusCode).toBe(422);
    expect(body.body.status).toBe(false);
    expect(body.body.message).toBe("Body request error");
    expect(returnBody[0].path).toBe("userId");
    expect(returnBody[0].msg).toBe("User Id is required.");
  }, 30000);

});
