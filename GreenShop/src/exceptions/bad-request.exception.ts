import HttpException from "./http.exception";

export default class BadRequestException extends HttpException {
  constructor(code: number, message: string) {
    super(400, code, message);
  }
}
