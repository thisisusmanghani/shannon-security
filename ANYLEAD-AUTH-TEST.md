# AnyLead Auth Security Test Setup

## Vulnerabilities to Test For

Shannon will analyze your authentication module for:

### 🔴 Critical Vulnerabilities
1. **Broken Authentication**
   - JWT token manipulation
   - Session fixation
   - Weak password policies
   - Missing token expiration

2. **SQL Injection**
   - Login form SQL injection
   - Signup form parameter injection
   - Database query manipulation in role checks

3. **Authorization Bypass**
   - RBAC circumvention
   - Horizontal privilege escalation
   - Vertical privilege escalation
   - Missing authorization checks

4. **Injection Attacks**
   - XSS in error messages
   - LDAP injection
   - NoSQL injection (if applicable)

5. **SSRF (Server-Side Request Forgery)**
   - Redirect manipulation in OTP flow
   - Open redirect in email verification

### 🟠 High Priority Areas
- OTP brute force protection
- Rate limiting on login attempts
- Password reset token security
- Refresh token rotation
- CORS misconfigurations
- JWT algorithm confusion attacks

### Current Implementation Analysis

Your auth flow uses:
- ✅ Supabase for authentication (good)
- ✅ JWT with RS256 (secure algorithm)
- ✅ JWKS for key rotation
- ✅ RBAC implementation
- ⚠️ OTP without visible rate limiting
- ⚠️ No visible password complexity requirements
- ⚠️ Logging sensitive data (passwords in console logs)

## Running Shannon

To start the security audit:

```bash
# 1. Make sure your backend is running
cd "../Developments/anylead-backend"
npm install
npm run dev    # Should run on http://localhost:3000

# 2. In another terminal, set up Shannon
cd shannon

# 3. Set your Anthropic API key
export ANTHROPIC_API_KEY="your-api-key"
export CLAUDE_CODE_MAX_OUTPUT_TOKENS=64000

# 4. Run Shannon
./shannon start URL=http://localhost:3000 REPO=anylead CONFIG=./configs/anylead-auth-config.yaml

# 5. Monitor progress
./shannon logs
```

## Expected Findings

Based on code review, Shannon may find:

1. **Password exposure in logs** (Line 27, authRoutes.ts) - Console logging sensitive data
2. **Error message information disclosure** - Revealing system details
3. **Missing rate limiting** - No visible brute force protection on login/OTP
4. **Weak input validation** - Basic email/password checks only
5. **RBAC default fallback** - Defaults to 'user' role on profile fetch error
6. **Token exposure** - Refresh tokens returned in API responses

## Next Steps After Shannon

1. Review Shannon's report
2. Prioritize critical/high findings
3. Implement fixes
4. Re-run Shannon to verify
5. Consider adding:
   - Rate limiting middleware
   - Input sanitization
   - Password complexity requirements
   - Audit logging
   - Token rotation
