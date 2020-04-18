using System;
using FluentAssertions;
using Xunit;

namespace ConsoleApp.Tests
{
    public class CalculatorTests
    {
        [Fact]
        public void GivenThatIAmAddingTwoNumbersUSingTheMEthodAsAnExtensionMethod()
        {
            // Arrange
            var valueA = 12;
            var valueB = 5;

            // Act
            var result = valueA.Add(valueB);

            // Assert
            result.Should().Be(valueA + valueB);
        }
    }
}
