# Contributing to LFP Analysis Pipeline

Thank you for your interest in contributing to this LFP analysis pipeline! This document provides guidelines for contributing to the project.

## How to Contribute

### Reporting Issues

If you find a bug or have a suggestion for improvement:

1. Check if the issue already exists in the GitHub Issues
2. If not, create a new issue with:
   - A clear, descriptive title
   - Detailed description of the problem or suggestion
   - Steps to reproduce (for bugs)
   - Expected vs. actual behavior
   - MATLAB version and FieldTrip version
   - Sample code if applicable

### Suggesting Enhancements

We welcome suggestions for new features or improvements:

1. Open an issue with the "enhancement" label
2. Describe the feature and its use case
3. Explain why it would be useful to the laboratory
4. Consider providing a proof-of-concept if possible

### Code Contributions

If you'd like to contribute code:

1. **Fork the repository** and create a feature branch
2. **Follow MATLAB coding standards**:
   - Use clear, descriptive variable names
   - Add comments for complex logic
   - Include function headers with usage examples
   - Use consistent indentation (4 spaces)
3. **Test your changes**:
   - Verify code works with sample data
   - Check compatibility with FieldTrip
   - Ensure no errors or warnings
4. **Document your changes**:
   - Update relevant README files
   - Add comments to new functions
   - Update USER_GUIDE.md if needed
5. **Submit a pull request**:
   - Reference any related issues
   - Describe what changes you made and why
   - Include before/after examples if applicable

## Code Style Guidelines

### MATLAB Code Style

```matlab
% Function header with clear documentation
% Function: compute_example
% Description: Brief description of what the function does
%
% Usage:
%   result = compute_example(input1, input2)
%
% Inputs:
%   input1 - Description of first input
%   input2 - Description of second input
%
% Output:
%   result - Description of output

function result = compute_example(input1, input2)
    % Use descriptive variable names
    processed_data = process_input(input1);
    
    % Add comments for complex operations
    % This step performs XYZ calculation
    intermediate_result = complex_calculation(processed_data, input2);
    
    % Final computation
    result = finalize_result(intermediate_result);
end
```

### File Organization

- **Scripts**: Main analysis workflows go in `scripts/`
- **Functions**: Reusable utility functions go in `functions/`
- **Configuration**: Parameters and settings go in `config/`
- **Documentation**: Guides and documentation go in `docs/`

## Development Workflow

1. **Create a branch**: `git checkout -b feature/your-feature-name`
2. **Make changes**: Implement your feature or fix
3. **Test thoroughly**: Verify with different datasets
4. **Commit**: Use clear, descriptive commit messages
5. **Push**: `git push origin feature/your-feature-name`
6. **Pull Request**: Open a PR with description of changes

## Testing

Before submitting:

1. Test with sample LFP data
2. Verify FieldTrip compatibility
3. Check for MATLAB warnings
4. Ensure functions work with different input formats
5. Test edge cases (empty data, single channel, etc.)

## Documentation Standards

### Function Documentation

Every function should include:
- Purpose/description
- Usage examples
- Input parameter descriptions
- Output description
- Author and date

### README Files

- Keep README files up to date
- Use clear, concise language
- Include examples where helpful
- Update table of contents if adding sections

## Questions?

If you have questions about contributing:
- Open an issue for discussion
- Contact the repository maintainer
- Review existing code for examples

## Code of Conduct

Be respectful and constructive in all interactions. This is a collaborative research environment.

## License

By contributing, you agree that your contributions will be licensed under the same license as the project.

---

Thank you for helping improve this LFP analysis pipeline!
