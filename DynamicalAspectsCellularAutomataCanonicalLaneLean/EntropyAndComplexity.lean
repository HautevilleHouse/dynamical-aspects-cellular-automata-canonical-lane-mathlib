import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsCellularAutomataCanonicalLaneLean

structure EntropyAndComplexity (A : CellularAutomaton) where
  TopologicalEntropy : ℝ
  LanguageComplexity : ℕ → ℕ
  GrowthRate : Prop
  EntropyUpperBound : Prop

structure EntropyEvidence (A : CellularAutomaton) (E : EntropyAndComplexity A) where
  growthRateClosed : E.GrowthRate
  entropyUpperBoundClosed : E.EntropyUpperBound

def EntropyAndComplexityClosed (A : CellularAutomaton) (E : EntropyAndComplexity A) : Prop :=
  E.GrowthRate ∧ E.EntropyUpperBound

theorem entropy_and_complexity_closed (A : CellularAutomaton) (E : EntropyAndComplexity A) (Ev : EntropyEvidence A E) :
    EntropyAndComplexityClosed A E := by
  exact And.intro Ev.growthRateClosed Ev.entropyUpperBoundClosed

end DynamicalAspectsCellularAutomataCanonicalLaneLean
end HautevilleHouse