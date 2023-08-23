const app = require("../../app");
const request = require("supertest");
const { log } = require("console");
const utils = require("../../utils");

describe("GET /api/profile", () => {
    let server; // Declare a variable to hold the server instance
    const token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywiZW1haWwiOiJtbmVvY2ljZXJva0BnbWFpbC5jb20iLCJmdWxsbmFtZSI6Im5lbyBrb2RhIiwiYWdlIjpudWxsLCJwYXNzd29yZCI6IiQyYSQxMCRrLklzT2RITExsenNzcVBheUhvTHd1a21LRTJlei5NbldDZUl5cWFaWU1ySE9PSzB2RmtscSIsInN0YXR1cyI6IlZFUklGSUVEIiwicm9sZSI6IlVTRVIiLCJjcmVhdGVkQXQiOiIyMDIzLTA4LTIyVDA2OjI4OjMwLjU4MFoiLCJpYXQiOjE2OTI3OTI3Njh9.MqJUOtocXj5f6SNFnXGuhwWGS67w0G9gATfnUJZDXzw";
    const wrongToken ="abcdefgh";

    beforeAll(() => {
      server = app.listen(8000); // Start the server before running tests
    });
  
    afterAll((done) => {
      server.close(done); // Close the server after all tests are done
    });  
  
    test("get profile details with correct token", async () => {
      const { statusCode, body } = await request(app)
      .get("/api/profile")
      .set('Authorization', `Bearer ${token}`);
      const returnBody = body.body.body;

      expect(statusCode).toBe(200);
      expect(body.body.status).toBe(true);
      expect(typeof returnBody.id).toBe("number");
      expect(typeof returnBody.email).toBe("string");
      expect(typeof returnBody.fullname).toBe("string");
      expect(typeof returnBody.password).toBe("string");
      expect(typeof returnBody.role).toBe("string");
      expect(typeof returnBody.status).toBe("string");
    }, 30000);
  
    test("get profile details with wrong token", async () => {
      const { statusCode, body } = await request(app)
      .get("/api/profile")
      .set('Authorization', `Bearer ${wrongToken}`);

      expect(statusCode).toBe(403);
      expect(body.body.status).toBe(false);
      expect(body.body.message).toBe("Invalid token.");
    }, 30000);
  
    test("get profile details with wrong token", async () => {
        const { statusCode, body } = await request(app)
        .get("/api/profile")

        expect(statusCode).toBe(401);
        expect(body.body.status).toBe(false);
        expect(body.body.message).toBe("Access token not found.");
    }, 30000);
});