from django.utils.deprecation import MiddlewareMixin
from django.views.decorators.csrf import ensure_csrf_cookie
from typing import Callable, Any
from django.http import HttpRequest, HttpResponse


class EnsureCSRFMiddleware(MiddlewareMixin):
    """
    Middleware that ensures a CSRF cookie is set on every request.

    This middleware wraps the view function with Django's `ensure_csrf_cookie` decorator,
    which guarantees that a CSRF cookie is present in the response, even for unauthenticated users
    or on GET requests. This is useful for applications that rely on JavaScript to make
    subsequent POST requests and need the CSRF token to be available in the browser.

    Methods:
        process_view(request, view_func, view_args, view_kwargs):
            Wraps the view function with `ensure_csrf_cookie` and processes the request.
    """

    def process_view(
        self,
        request: HttpRequest,
        view_func: Callable[..., HttpResponse],
        view_args: list[Any],
        view_kwargs: dict[str, Any],
    ) -> HttpResponse:
        return ensure_csrf_cookie(view_func)(request, *view_args, **view_kwargs)
